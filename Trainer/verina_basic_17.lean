import Aesop

/-
-----Description----- 
This task requires writing a Lean 4 method that converts all uppercase
characters in a given string to their lowercase equivalents while keeping the
other characters unchanged. The output string must have the same length as the
input string.

-----Input-----
The input consists of:
s: A string that may contain both uppercase and lowercase characters.

-----Output-----
The output is a string:
Returns a new string where every uppercase letter has been converted to
lowercase, and every non-uppercase character remains exactly as in the input.

-----Note-----
There are no preconditions; the method is expected to work for any non-null
string.
-/

@[reducible, simp]
def toLowercase_precond (s : String) : Prop := sorry

def toLowercase (s : String) (h_precond : toLowercase_precond s) : String := sorry

@[reducible, simp]
def toLowercase_postcond (s : String) (result : String) (h_precond : toLowercase_precond s) : Prop := sorry

theorem toLowercase_spec_satisfied (s : String) (h_precond : toLowercase_precond s) :
    toLowercase_postcond s (toLowercase s h_precond) h_precond := by
  sorry

-- Test Guards

-- Test case 1
#guard toLowercase_precond ("Hello, World!")
#guard toLowercase_postcond ("Hello, World!") ("hello, world!") (by aesop)
#guard ¬(toLowercase_postcond ("Hello, World!") ("Hello, world!") (by aesop))
#guard ¬(toLowercase_postcond ("Hello, World!") ("HELLO, WORLD!") (by aesop))
#guard ¬(toLowercase_postcond ("Hello, World!") ("hello, World!") (by aesop))
#guard toLowercase ("Hello, World!") (by aesop) = ("hello, world!")

-- Test case 2
#guard toLowercase_precond ("ABC")
#guard toLowercase_postcond ("ABC") ("abc") (by aesop)
#guard ¬(toLowercase_postcond ("ABC") ("ABC") (by aesop))
#guard ¬(toLowercase_postcond ("ABC") ("Abc") (by aesop))
#guard ¬(toLowercase_postcond ("ABC") ("aBC") (by aesop))
#guard toLowercase ("ABC") (by aesop) = ("abc")

-- Test case 3
#guard toLowercase_precond ("abc")
#guard toLowercase_postcond ("abc") ("abc") (by aesop)
#guard ¬(toLowercase_postcond ("abc") ("ABC") (by aesop))
#guard ¬(toLowercase_postcond ("abc") ("aBc") (by aesop))
#guard ¬(toLowercase_postcond ("abc") ("abC") (by aesop))
#guard toLowercase ("abc") (by aesop) = ("abc")

-- Test case 4
#guard toLowercase_precond ("")
#guard toLowercase_postcond ("") ("") (by aesop)
#guard ¬(toLowercase_postcond ("") (" ") (by aesop))
#guard ¬(toLowercase_postcond ("") ("empty") (by aesop))
#guard ¬(toLowercase_postcond ("") ("null") (by aesop))
#guard toLowercase ("") (by aesop) = ("")

-- Test case 5
#guard toLowercase_precond ("1234!@")
#guard toLowercase_postcond ("1234!@") ("1234!@") (by aesop)
#guard ¬(toLowercase_postcond ("1234!@") ("1234!#") (by aesop))
#guard ¬(toLowercase_postcond ("1234!@") ("12345!@") (by aesop))
#guard toLowercase ("1234!@") (by aesop) = ("1234!@")

-- Test case 6
#guard toLowercase_precond ("MixedCASE123")
#guard toLowercase_postcond ("MixedCASE123") ("mixedcase123") (by aesop)
#guard ¬(toLowercase_postcond ("MixedCASE123") ("Mixedcase123") (by aesop))
#guard ¬(toLowercase_postcond ("MixedCASE123") ("mixedCASE123") (by aesop))
#guard ¬(toLowercase_postcond ("MixedCASE123") ("MIXEDCASE123") (by aesop))
#guard toLowercase ("MixedCASE123") (by aesop) = ("mixedcase123")
