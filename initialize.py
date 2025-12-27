import json
import sys
from pathlib import Path
from dataclasses import dataclass
from typing import List, Dict, Any, Optional

# Directory constants
SCRIPT_DIR = Path(__file__).resolve().parent
DATASET_DIR = SCRIPT_DIR / "dataset"
EXERCISES_DIR = SCRIPT_DIR / "Trainer"


# Data structures
@dataclass
class Parameter:
    param_name: str
    param_type: str


@dataclass
class Signature:
    name: str
    parameters: List[Parameter]
    return_type: str


@dataclass
class TestCase:
    input: Dict[str, Any]
    expected: Any
    unexpected: List[Any]


@dataclass
class Exercise:
    exercise_id: str
    description: str
    signature: Signature
    test_cases: List[TestCase]
    reject_inputs: List[Dict[str, Any]]


# Loading functions
def load_exercise(exercise_dir: Path) -> Optional[Exercise]:
    """Load exercise data from directory containing task.json, description.txt, test.json, reject_inputs.json"""
    try:
        # Load task.json
        with (exercise_dir / "task.json").open('r') as f:
            task_data = json.load(f)

        # Extract exercise ID
        exercise_id = task_data["id"]

        # Parse signature
        sig_data = task_data["signature"]
        parameters = [
            Parameter(p["param_name"], p["param_type"])
            for p in sig_data["parameters"]
        ]
        signature = Signature(
            name=sig_data["name"],
            parameters=parameters,
            return_type=sig_data["return_type"]
        )

        # Load description
        desc_file = task_data.get("description_file", "./description.txt")
        with (exercise_dir / desc_file).open('r') as f:
            description = f.read()

        # Load test cases
        test_file = task_data.get("test_file", "./test.json")
        with (exercise_dir / test_file).open('r') as f:
            test_data = json.load(f)
        test_cases = [
            TestCase(
                input=tc["input"],
                expected=tc["expected"],
                unexpected=tc.get("unexpected", [])
            )
            for tc in test_data
        ]

        # Load reject inputs
        reject_file = task_data.get("reject_inputs_file", "./reject_inputs.json")
        with (exercise_dir / reject_file).open('r') as f:
            reject_data = json.load(f)

        return Exercise(
            exercise_id=exercise_id,
            description=description,
            signature=signature,
            test_cases=test_cases,
            reject_inputs=reject_data
        )

    except Exception as e:
        print(f"Error loading exercise from {exercise_dir.name}: {e}", file=sys.stderr)
        return None


# Helper utilities
def format_parameters(params: List[Parameter]) -> str:
    """Convert parameter list to Lean syntax: (name1 : Type1) (name2 : Type2)"""
    return " ".join(f"({p.param_name} : {p.param_type})" for p in params)


def format_parameter_names(params: List[Parameter]) -> str:
    """Extract just parameter names: name1 name2 name3"""
    return " ".join(p.param_name for p in params)


def serialize_value(value: Any, param_type: str = "") -> str:
    """Convert JSON value to Lean syntax"""
    if isinstance(value, bool):
        return "true" if value else "false"
    elif isinstance(value, int):
        return str(value)
    elif isinstance(value, str):
        # Check if it's already Lean syntax (arrays/lists)
        if value.startswith("#[") or value.startswith("["):
            return value
        # Only wrap in quotes if the parameter type is String
        if "String" in param_type:
            return f'"{value}"'
        # Otherwise, it's likely Lean syntax (like "some (1)", "none", etc.)
        return value
    elif isinstance(value, list):
        # Convert list to Lean list syntax
        items = [serialize_value(v, param_type) for v in value]
        return f"[{', '.join(items)}]"
    else:
        return str(value)


# Template generation functions
def wrap_text(text: str, width: int = 80) -> str:
    """
    Wrap text to specified width, breaking at word boundaries.
    Preserves existing line breaks and formatting.
    """
    lines = text.split('\n')
    wrapped_lines = []

    for line in lines:
        # If line is already short enough, keep it
        if len(line) <= width:
            wrapped_lines.append(line)
            continue

        # Otherwise, wrap it
        words = line.split()
        current_line = []
        current_length = 0

        for word in words:
            word_length = len(word)
            # +1 for the space before the word
            if current_length + word_length + (1 if current_line else 0) <= width:
                current_line.append(word)
                current_length += word_length + (1 if current_line else 0)
            else:
                # Start a new line
                if current_line:
                    wrapped_lines.append(' '.join(current_line))
                current_line = [word]
                current_length = word_length

        # Add the last line
        if current_line:
            wrapped_lines.append(' '.join(current_line))

    return '\n'.join(wrapped_lines)


def format_description(description: str) -> str:
    """Format description as multi-line comment with line wrapping"""
    wrapped = wrap_text(description, width=80)
    return f"/-\n{wrapped}\n-/"


def format_precond_definition(sig: Signature) -> str:
    """Generate precondition definition"""
    params = format_parameters(sig.parameters)
    return f"@[reducible, simp]\ndef {sig.name}_precond {params} : Prop := sorry"


def format_function_definition(sig: Signature) -> str:
    """Generate function definition with h_precond parameter"""
    params = format_parameters(sig.parameters)
    param_names = format_parameter_names(sig.parameters)
    return f"def {sig.name} {params} (h_precond : {sig.name}_precond {param_names}) : {sig.return_type} := sorry"


def format_postcond_definition(sig: Signature) -> str:
    """Generate postcondition definition with result and h_precond parameters"""
    params = format_parameters(sig.parameters)
    param_names = format_parameter_names(sig.parameters)
    return f"@[reducible, simp]\ndef {sig.name}_postcond {params} (result : {sig.return_type}) (h_precond : {sig.name}_precond {param_names}) : Prop := sorry"


def format_proof_theorem(sig: Signature) -> str:
    """Generate proof theorem signature"""
    params = format_parameters(sig.parameters)
    param_names = format_parameter_names(sig.parameters)
    return f"""theorem {sig.name}_spec_satisfied {params} (h_precond : {sig.name}_precond {param_names}) :
    {sig.name}_postcond {param_names} ({sig.name} {param_names} h_precond) h_precond := by
  sorry"""


def format_test_guards(exercise: Exercise) -> str:
    """Generate all test guards using #guard statements"""
    sig = exercise.signature
    guards = []

    guards.append("-- Test Guards\n")

    # Rejected inputs
    if exercise.reject_inputs:
        guards.append("-- Rejected inputs")
        for i, reject in enumerate(exercise.reject_inputs, 1):
            # Extract parameter values from input
            values = []
            for param in sig.parameters:
                value = reject["input"][param.param_name]
                values.append(f"({serialize_value(value, param.param_type)})")

            values_str = " ".join(values)
            guards.append(f"#guard ¬({sig.name}_precond {values_str})")
        guards.append("")  # Blank line after rejected inputs

    # Test cases
    for i, test_case in enumerate(exercise.test_cases, 1):
        guards.append(f"-- Test case {i}")

        # Extract parameter values from input
        values = []
        for param in sig.parameters:
            value = test_case.input[param.param_name]
            values.append(f"({serialize_value(value, param.param_type)})")

        values_str = " ".join(values)
        expected = f"({serialize_value(test_case.expected, sig.return_type)})"

        # Guard 1: Precondition is true
        guards.append(f"#guard {sig.name}_precond {values_str}")

        # Guard 2: Postcondition on expected output
        guards.append(f"#guard {sig.name}_postcond {values_str} {expected} (by aesop)")

        # Guard 3: Postcondition is false on unexpected outputs
        for unexpected in test_case.unexpected:
            unexpected_val = f"({serialize_value(unexpected, sig.return_type)})"
            guards.append(f"#guard ¬({sig.name}_postcond {values_str} {unexpected_val} (by aesop))")

        # Guard 4: Function equals expected
        guards.append(f"#guard {sig.name} {values_str} (by aesop) = {expected}")

        guards.append("")  # Blank line between test cases

    return "\n".join(guards)


def generate_template(exercise: Exercise) -> str:
    """Generate complete Lean template for an exercise"""
    sections = [
        "import Aesop",
        "import Mathlib.Tactic",
        "",
        format_description(exercise.description),
        "",
        format_precond_definition(exercise.signature),
        "",
        format_function_definition(exercise.signature),
        "",
        format_postcond_definition(exercise.signature),
        "",
        format_proof_theorem(exercise.signature),
        "",
        format_test_guards(exercise)
    ]

    return "\n".join(sections)


def write_template_file(exercise: Exercise, template: str, output_dir: Path) -> None:
    """Write generated template to file"""
    output_file = output_dir / f"{exercise.exercise_id}.lean"
    output_file.write_text(template)


def main():
    """Main entry point"""
    # Validate directories
    if not DATASET_DIR.exists() or not DATASET_DIR.is_dir():
        sys.exit(f"Error: Dataset directory not found: {DATASET_DIR}")

    if not EXERCISES_DIR.exists() or not EXERCISES_DIR.is_dir():
        sys.exit(f"Error: Trainer directory not found: {EXERCISES_DIR}")

    # Process all exercises
    successes = 0
    failures = 0

    for exercise_dir in sorted(DATASET_DIR.iterdir()):
        # Skip non-directories and non-exercise directories
        if not exercise_dir.is_dir():
            continue

        dir_name = exercise_dir.name
        if not (dir_name.startswith("verina_basic_") or dir_name.startswith("verina_advanced_")):
            continue

        # Load exercise
        exercise = load_exercise(exercise_dir)
        if exercise is None:
            failures += 1
            continue

        # Generate template
        try:
            template = generate_template(exercise)
            write_template_file(exercise, template, EXERCISES_DIR)
            successes += 1
            print(f"✓ Generated {exercise.exercise_id}.lean")
        except Exception as e:
            failures += 1
            print(f"✗ Error generating {exercise.exercise_id}: {e}", file=sys.stderr)

    # Report summary
    print(f"\nGenerated {successes} templates successfully")
    if failures > 0:
        print(f"{failures} exercises failed", file=sys.stderr)


if __name__ == "__main__":
    main()
