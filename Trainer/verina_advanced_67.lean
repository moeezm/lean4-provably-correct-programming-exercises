import Aesop

/-
-----Description-----
This task requires writing a Lean 4 method that performs run-length encoding on
a given string. The method should scan the string from left to right and group
consecutive identical characters into pairs. Each pair consists of the character
itself and the number of times it appears consecutively. For example, "aaabbc"
becomes [(’a’, 3), (’b’, 2), (’c’, 1)].

The resulting encoded list must satisfy the following properties:
1. No pair has a zero or negative run-length.
2. Consecutive pairs in the encoding list must not have the same character.
3. Decoding the output should return the original string.

-----Input-----
The input is a single string, `s`.

-----Output-----
The output is a list of pairs `(Char, Nat)`, which represents the
run-length-encoded form of the input string.


-/

@[reducible, simp]
def runLengthEncode_precond (s : String) : Prop := sorry

def runLengthEncode (s : String) (h_precond : runLengthEncode_precond s) : List (Char × Nat) := sorry

@[reducible, simp]
def runLengthEncode_postcond (s : String) (result : List (Char × Nat)) (h_precond : runLengthEncode_precond s) : Prop := sorry

theorem runLengthEncode_spec_satisfied (s : String) (h_precond : runLengthEncode_precond s) :
    runLengthEncode_postcond s (runLengthEncode s h_precond) h_precond := by
  sorry

-- Test Guards

-- Test case 1
#guard runLengthEncode_precond ("")
#guard runLengthEncode_postcond ("") ([]) (by aesop)
#guard ¬(runLengthEncode_postcond ("") ([('x', 1)]) (by aesop))
#guard runLengthEncode ("") (by aesop) = ([])

-- Test case 2
#guard runLengthEncode_precond ("aaa")
#guard runLengthEncode_postcond ("aaa") ([('a', 3)]) (by aesop)
#guard ¬(runLengthEncode_postcond ("aaa") ([('a', 2), ('b', 3)]) (by aesop))
#guard runLengthEncode ("aaa") (by aesop) = ([('a', 3)])

-- Test case 3
#guard runLengthEncode_precond ("abbbcccaa")
#guard runLengthEncode_postcond ("abbbcccaa") ([('a', 1), ('b', 3), ('c', 3), ('a', 2)]) (by aesop)
#guard ¬(runLengthEncode_postcond ("abbbcccaa") ([('a', 2), ('b', 3), ('c', 3), ('a', 2)]) (by aesop))
#guard runLengthEncode ("abbbcccaa") (by aesop) = ([('a', 1), ('b', 3), ('c', 3), ('a', 2)])

-- Test case 4
#guard runLengthEncode_precond ("xyz")
#guard runLengthEncode_postcond ("xyz") ([('x', 1), ('y', 1), ('z', 1)]) (by aesop)
#guard ¬(runLengthEncode_postcond ("xyz") ([('x', 3)]) (by aesop))
#guard ¬(runLengthEncode_postcond ("xyz") ([('z', 1)]) (by aesop))
#guard runLengthEncode ("xyz") (by aesop) = ([('x', 1), ('y', 1), ('z', 1)])

-- Test case 5
#guard runLengthEncode_precond ("aabbaa")
#guard runLengthEncode_postcond ("aabbaa") ([('a', 2), ('b', 2), ('a', 2)]) (by aesop)
#guard ¬(runLengthEncode_postcond ("aabbaa") ([('a', 2), ('b', 2), ('a', 3)]) (by aesop))
#guard runLengthEncode ("aabbaa") (by aesop) = ([('a', 2), ('b', 2), ('a', 2)])
