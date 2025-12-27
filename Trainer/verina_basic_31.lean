import Aesop

/-
-----Description----- 
This task requires writing a Lean 4 method that converts a given string to
uppercase. The method should replace every lowercase letter in the input string
with its corresponding uppercase character while leaving all other characters
unchanged. The output string must have the same length as the input string.

-----Input-----
The input consists of:
s: A string.

-----Output-----
The output is a string:
Returns a new string in which every lowercase letter from the input string is
converted to uppercase, and all other characters are exactly the same as in the
input string, ensuring the output string has the same length as the input.

-----Note-----
There are no preconditions since the method assumes that the input string is
always valid (i.e., non-null).
-/

@[reducible, simp]
def toUppercase_precond (s : String) : Prop := sorry

def toUppercase (s : String) (h_precond : toUppercase_precond s) : String := sorry

@[reducible, simp]
def toUppercase_postcond (s : String) (result : String) (h_precond : toUppercase_precond s) : Prop := sorry

theorem toUppercase_spec_satisfied (s : String) (h_precond : toUppercase_precond s) :
    toUppercase_postcond s (toUppercase s h_precond) h_precond := by
  sorry

-- Test Guards

-- Test case 1
#guard toUppercase_precond ("Hello, World!")
#guard toUppercase_postcond ("Hello, World!") ("HELLO, WORLD!") (by aesop)
#guard ¬(toUppercase_postcond ("Hello, World!") ("hello, world!") (by aesop))
#guard ¬(toUppercase_postcond ("Hello, World!") ("HeLLo, WORld!") (by aesop))
#guard toUppercase ("Hello, World!") (by aesop) = ("HELLO, WORLD!")

-- Test case 2
#guard toUppercase_precond ("abc")
#guard toUppercase_postcond ("abc") ("ABC") (by aesop)
#guard ¬(toUppercase_postcond ("abc") ("AbC") (by aesop))
#guard ¬(toUppercase_postcond ("abc") ("abc") (by aesop))
#guard toUppercase ("abc") (by aesop) = ("ABC")

-- Test case 3
#guard toUppercase_precond ("ABC")
#guard toUppercase_postcond ("ABC") ("ABC") (by aesop)
#guard ¬(toUppercase_postcond ("ABC") ("abc") (by aesop))
#guard ¬(toUppercase_postcond ("ABC") ("aBC") (by aesop))
#guard ¬(toUppercase_postcond ("ABC") ("Abc") (by aesop))
#guard toUppercase ("ABC") (by aesop) = ("ABC")

-- Test case 4
#guard toUppercase_precond ("123!?@")
#guard toUppercase_postcond ("123!?@") ("123!?@") (by aesop)
#guard ¬(toUppercase_postcond ("123!?@") ("123!@?") (by aesop))
#guard ¬(toUppercase_postcond ("123!?@") ("321!?@") (by aesop))
#guard toUppercase ("123!?@") (by aesop) = ("123!?@")

-- Test case 5
#guard toUppercase_precond ("")
#guard toUppercase_postcond ("") ("") (by aesop)
#guard ¬(toUppercase_postcond ("") (" ") (by aesop))
#guard ¬(toUppercase_postcond ("") ("a") (by aesop))
#guard toUppercase ("") (by aesop) = ("")
