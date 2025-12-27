# Lean 4 Provably Correct Programming Exercises

(script and README written mostly by Claude)

A collection of programming exercises for learning how to program and prove correctness of programs in Lean 4. Each exercise challenges you to implement a function, define preconditions and postconditions, and prove that your implementation satisfies the specification.

These exercises are from the [Verina benchmark](https://verina.io), this is just formatting them into Lean files for human use.

## Installation and Setup

### 1. Install Lean 4

Follow the installation instructions at [https://leanprover.github.io/lean4/doc/setup.html](https://leanprover.github.io/lean4/doc/setup.html)

Make sure your editor is setup for Lean: [Lean 4 editor setup guide](https://leanprover.github.io/lean4/doc/setup.html#editor-setup)


### 2. Initialize the Lake Project

Navigate to the trainer directory and initialize the Lake project:

```bash
cd trainer
lake update
lake build
```

This will:
- Download and build dependencies (which is just Mathlib but includes other stuff like Aesop)
- Set up the Lean toolchain specified in `lean-toolchain`
- Prepare the project for development

### 3. Generate Exercise Files

Generate the exercise templates from the dataset:

```bash
python3 initialize.py
```

This creates 189 exercise files in `Trainer/`:
- 108 basic exercises (`verina_basic_*.lean`)
- 81 advanced exercises (`verina_advanced_*.lean`)

**Note**: The exercise files are not tracked in git. You need to generate them locally before starting work.

## Exercise Structure

There are **basic** and **advanced** exercises. Each exercise consists of **five main parts**.

### 1. Natural Language Description

At the top of each file, a comment block describes:
- The problem you need to solve
- Input specifications
- Expected output behavior
- Any important notes or constraints

```lean
/-
-----Description-----
This task requires writing a Lean 4 method that determines whether two given
integers have opposite signs...
-/
```

Based on this description you must complete the following parts:
### 2. Precondition

**Your task**: Define the conditions that must hold for inputs for your function to work properly (e.g.,
index in bounds).

### 3. Function Implementation

Implement the actual function that solves the problem:

```lean
def hasOppositeSign (a : Int) (b : Int) (h_precond : hasOppositeSign_precond a b) : Bool :=
  -- TODO: Implement the function
  sorry
```

**Your task**: Replace `sorry` with your implementation. Note that you have access to `h_precond`, a proof that the precondition holds.

### 4. Postcondition

Define what properties the output must satisfy:

```lean
@[reducible, simp]
def hasOppositeSign_postcond (a : Int) (b : Int) (result : Bool) (h_precond : hasOppositeSign_precond a b) : Prop :=
  -- TODO: Define what makes the result correct
  -- Example: result = true ↔ (a > 0 ∧ b < 0) ∨ (a < 0 ∧ b > 0)
  sorry
```

**Your task**: Replace `sorry` with a formal specification of correct outputs.

### 5. Correctness Proof

Prove that your implementation satisfies the postcondition (conditional on the precondition):

```lean
theorem hasOppositeSign_spec_satisfied (a : Int) (b : Int) (h_precond : hasOppositeSign_precond a b) :
    hasOppositeSign_postcond a b (hasOppositeSign a b h_precond) h_precond := by
  -- TODO: Prove that your function is correct
  sorry
```

**Your task**: Replace `sorry` with a proof that your function satisfies the specification.

## Test Guards

Each exercise includes automated test cases using `#guard` statements.

```lean
-- Test case 1
#guard hasOppositeSign_precond (-5) (10)
#guard hasOppositeSign_postcond (-5) (10) (true) (by aesop)
#guard ¬(hasOppositeSign_postcond (-5) (10) (false) (by aesop))
#guard hasOppositeSign (-5) (10) (by aesop) = (true)
```

### What the guards check:

1. **Precondition validity**: `#guard functionName_precond (inputs)`
   - Verifies the precondition holds for test inputs

2. **Postcondition on expected output**: `#guard functionName_postcond (inputs) (expected) (by aesop)`
   - Verifies the postcondition is satisfied by the expected output

3. **Postcondition on unexpected outputs**: `#guard ¬(functionName_postcond (inputs) (unexpected) (by aesop))`
   - Verifies the postcondition rejects incorrect outputs

4. **Function correctness**: `#guard functionName (inputs) (by aesop) = (expected)`
   - Verifies your function produces the expected output

### Rejected Inputs

Some exercises include rejected input tests:
```lean
-- Rejected inputs
#guard ¬(swap_precond (#[1, 2, 3, 4]) (-1) (2))
```

These verify that the precondition correctly rejects invalid inputs.

### Use of Aesop

The `aesop` tactic is used to automatically construct proofs of the preconditions for test cases. This works when:
- Your precondition is fully specified
- The precondition can be evaluated on concrete values

If Aesop fails, you may need to refine your precondition definition or provide your own proof (try `grind` or `decide`, maybe? You can also just pass in a sorry)

## Example Exercise

```lean
import Aesop

@[reducible, simp]
def hasOppositeSign_precond (a : Int) (b : Int) : Prop :=
  True

def hasOppositeSign (a : Int) (b : Int) (h_precond : hasOppositeSign_precond a b) : Bool :=
  (a > 0 ∧ b < 0) ∨ (a < 0 ∧ b > 0)

@[reducible, simp]
def hasOppositeSign_postcond (a : Int) (b : Int) (result : Bool) (h_precond : hasOppositeSign_precond a b) : Prop :=
  result = true ↔ ((a > 0 ∧ b < 0) ∨ (a < 0 ∧ b > 0))

theorem hasOppositeSign_spec_satisfied (a : Int) (b : Int) (h_precond : hasOppositeSign_precond a b) :
    hasOppositeSign_postcond a b (hasOppositeSign a b h_precond) h_precond := by
  unfold hasOppositeSign_postcond hasOppositeSign
  simp
```

## Solutions
For a given problem, you can see the solution in `dataset/<exercise_name>/task.lean`. Not all exercises have solutions for the proofs.

## Compiling Exercises
You should be able to get by with the Lean LSP, but if you want to compile a specific exercise, you can run `lake build Trainer.<exercise_name>`. (Notice it's a `.` and not a `/`).

## Regenerating Exercises

If you need to reset exercises or update from the dataset:

```bash
python3 initialize.py
```

**Warning**: This will overwrite all files in `Trainer/`. Save your work elsewhere if needed!

## Acknowledgments

The exercises in this project are taken from the [**Verina benchmark**](https://verina.io), a dataset for evaluating formal verification capabilities of large language models. We gratefully acknowledge the creators of Verina for making these exercises available.

## License

This project is licensed under the Apache License 2.0. See the LICENSE file for details.
