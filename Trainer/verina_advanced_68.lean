import Aesop

/-
-----Description----- 
This task requires implementing a Run-Length Encoding (RLE) algorithm in Lean
4. The method should take a string as input and return a compressed string where
consecutive duplicate characters are replaced by the character followed by its
count. The output must strictly alternate between characters and digits,
reconstruct to the original input when decoded, and return a non-empty string if
and only if the input is non-empty.

-----Input-----
The input is a string consisting of any characters (including special
characters and digits).

-----Output-----
The output is a string where each sequence of identical characters is replaced
by the character followed by its count. The output must:
1. Alternate between characters and digits (e.g., "a3b2").
2. Reconstruct to the original input when decoded.
3. Be non-empty if and only if the input is non-empty.


-/

@[reducible, simp]
def runLengthEncoder_precond (input : String) : Prop := sorry

def runLengthEncoder (input : String) (h_precond : runLengthEncoder_precond input) : String := sorry

@[reducible, simp]
def runLengthEncoder_postcond (input : String) (result : String) (h_precond : runLengthEncoder_precond input) : Prop := sorry

theorem runLengthEncoder_spec_satisfied (input : String) (h_precond : runLengthEncoder_precond input) :
    runLengthEncoder_postcond input (runLengthEncoder input h_precond) h_precond := by
  sorry

-- Test Guards

-- Test case 1
#guard runLengthEncoder_precond ("aaabbbcc")
#guard runLengthEncoder_postcond ("aaabbbcc") ("a3b3c2") (by aesop)
#guard ¬(runLengthEncoder_postcond ("aaabbbcc") ("a3b3") (by aesop))
#guard ¬(runLengthEncoder_postcond ("aaabbbcc") ("a3b3c2x") (by aesop))
#guard ¬(runLengthEncoder_postcond ("aaabbbcc") ("abc") (by aesop))
#guard runLengthEncoder ("aaabbbcc") (by aesop) = ("a3b3c2")

-- Test case 2
#guard runLengthEncoder_precond ("!!!$$$%%%")
#guard runLengthEncoder_postcond ("!!!$$$%%%") ("!3$3%3") (by aesop)
#guard ¬(runLengthEncoder_postcond ("!!!$$$%%%") ("!3$3%") (by aesop))
#guard ¬(runLengthEncoder_postcond ("!!!$$$%%%") ("!!!$$$%%") (by aesop))
#guard ¬(runLengthEncoder_postcond ("!!!$$$%%%") ("!3$3%4") (by aesop))
#guard runLengthEncoder ("!!!$$$%%%") (by aesop) = ("!3$3%3")

-- Test case 3
#guard runLengthEncoder_precond ("aaaaa")
#guard runLengthEncoder_postcond ("aaaaa") ("a5") (by aesop)
#guard ¬(runLengthEncoder_postcond ("aaaaa") ("a4") (by aesop))
#guard ¬(runLengthEncoder_postcond ("aaaaa") ("a6") (by aesop))
#guard ¬(runLengthEncoder_postcond ("aaaaa") ("a") (by aesop))
#guard runLengthEncoder ("aaaaa") (by aesop) = ("a5")

-- Test case 4
#guard runLengthEncoder_precond ("abcd")
#guard runLengthEncoder_postcond ("abcd") ("a1b1c1d1") (by aesop)
#guard ¬(runLengthEncoder_postcond ("abcd") ("abcd") (by aesop))
#guard ¬(runLengthEncoder_postcond ("abcd") ("a1b1c1") (by aesop))
#guard ¬(runLengthEncoder_postcond ("abcd") ("a1b1c1d2") (by aesop))
#guard runLengthEncoder ("abcd") (by aesop) = ("a1b1c1d1")

-- Test case 5
#guard runLengthEncoder_precond ("")
#guard runLengthEncoder_postcond ("") ("") (by aesop)
#guard ¬(runLengthEncoder_postcond ("") ("a1") (by aesop))
#guard ¬(runLengthEncoder_postcond ("") (" ") (by aesop))
#guard runLengthEncoder ("") (by aesop) = ("")

-- Test case 6
#guard runLengthEncoder_precond ("AaABb")
#guard runLengthEncoder_postcond ("AaABb") ("A1a1A1B1b1") (by aesop)
#guard ¬(runLengthEncoder_postcond ("AaABb") ("AaABb") (by aesop))
#guard ¬(runLengthEncoder_postcond ("AaABb") ("A1a1A1B1") (by aesop))
#guard ¬(runLengthEncoder_postcond ("AaABb") ("A1a1A1B1b2") (by aesop))
#guard runLengthEncoder ("AaABb") (by aesop) = ("A1a1A1B1b1")

-- Test case 7
#guard runLengthEncoder_precond ("wwwwwwwwwwwwwwwww")
#guard runLengthEncoder_postcond ("wwwwwwwwwwwwwwwww") ("w17") (by aesop)
#guard ¬(runLengthEncoder_postcond ("wwwwwwwwwwwwwwwww") ("w16") (by aesop))
#guard ¬(runLengthEncoder_postcond ("wwwwwwwwwwwwwwwww") ("w18") (by aesop))
#guard ¬(runLengthEncoder_postcond ("wwwwwwwwwwwwwwwww") ("w") (by aesop))
#guard runLengthEncoder ("wwwwwwwwwwwwwwwww") (by aesop) = ("w17")

-- Test case 8
#guard runLengthEncoder_precond ("a")
#guard runLengthEncoder_postcond ("a") ("a1") (by aesop)
#guard ¬(runLengthEncoder_postcond ("a") ("a") (by aesop))
#guard ¬(runLengthEncoder_postcond ("a") ("a2") (by aesop))
#guard ¬(runLengthEncoder_postcond ("a") ("") (by aesop))
#guard runLengthEncoder ("a") (by aesop) = ("a1")

-- Test case 9
#guard runLengthEncoder_precond ("  ")
#guard runLengthEncoder_postcond ("  ") (" 2") (by aesop)
#guard ¬(runLengthEncoder_postcond ("  ") (" ") (by aesop))
#guard ¬(runLengthEncoder_postcond ("  ") (" 1") (by aesop))
#guard ¬(runLengthEncoder_postcond ("  ") (" 3") (by aesop))
#guard runLengthEncoder ("  ") (by aesop) = (" 2")
