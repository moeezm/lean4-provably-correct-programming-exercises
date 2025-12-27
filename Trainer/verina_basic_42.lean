import Aesop

/-
-----Description-----  
This task requires writing a Lean 4 method that counts the number of digit
characters within a given string. A digit is any character between '0' and '9'.
The method should determine how many such digit characters appear in the input.

-----Input-----  
The input consists of:  
s: A string.

-----Output-----  
The output is a natural number (Nat):  
Returns a non-negative count representing the number of digit characters found
in the input string.

-----Note-----  
There are no additional preconditions; the method works for any provided string.
-/

@[reducible, simp]
def countDigits_precond (s : String) : Prop := sorry

def countDigits (s : String) (h_precond : countDigits_precond s) : Nat := sorry

@[reducible, simp]
def countDigits_postcond (s : String) (result : Nat) (h_precond : countDigits_precond s) : Prop := sorry

theorem countDigits_spec_satisfied (s : String) (h_precond : countDigits_precond s) :
    countDigits_postcond s (countDigits s h_precond) h_precond := by
  sorry

-- Test Guards

-- Test case 1
#guard countDigits_precond ("123abc456")
#guard countDigits_postcond ("123abc456") (6) (by aesop)
#guard ¬(countDigits_postcond ("123abc456") (5) (by aesop))
#guard ¬(countDigits_postcond ("123abc456") (7) (by aesop))
#guard ¬(countDigits_postcond ("123abc456") (0) (by aesop))
#guard countDigits ("123abc456") (by aesop) = (6)

-- Test case 2
#guard countDigits_precond ("no digits here!")
#guard countDigits_postcond ("no digits here!") (0) (by aesop)
#guard ¬(countDigits_postcond ("no digits here!") (1) (by aesop))
#guard ¬(countDigits_postcond ("no digits here!") (2) (by aesop))
#guard ¬(countDigits_postcond ("no digits here!") (3) (by aesop))
#guard countDigits ("no digits here!") (by aesop) = (0)

-- Test case 3
#guard countDigits_precond ("1234567890")
#guard countDigits_postcond ("1234567890") (10) (by aesop)
#guard ¬(countDigits_postcond ("1234567890") (9) (by aesop))
#guard ¬(countDigits_postcond ("1234567890") (11) (by aesop))
#guard ¬(countDigits_postcond ("1234567890") (0) (by aesop))
#guard countDigits ("1234567890") (by aesop) = (10)

-- Test case 4
#guard countDigits_precond ("")
#guard countDigits_postcond ("") (0) (by aesop)
#guard ¬(countDigits_postcond ("") (1) (by aesop))
#guard ¬(countDigits_postcond ("") (2) (by aesop))
#guard ¬(countDigits_postcond ("") (10) (by aesop))
#guard countDigits ("") (by aesop) = (0)

-- Test case 5
#guard countDigits_precond ("a1b2c3")
#guard countDigits_postcond ("a1b2c3") (3) (by aesop)
#guard ¬(countDigits_postcond ("a1b2c3") (2) (by aesop))
#guard ¬(countDigits_postcond ("a1b2c3") (4) (by aesop))
#guard ¬(countDigits_postcond ("a1b2c3") (5) (by aesop))
#guard countDigits ("a1b2c3") (by aesop) = (3)

-- Test case 6
#guard countDigits_precond ("0")
#guard countDigits_postcond ("0") (1) (by aesop)
#guard ¬(countDigits_postcond ("0") (0) (by aesop))
#guard ¬(countDigits_postcond ("0") (2) (by aesop))
#guard ¬(countDigits_postcond ("0") (10) (by aesop))
#guard countDigits ("0") (by aesop) = (1)

-- Test case 7
#guard countDigits_precond ("abc")
#guard countDigits_postcond ("abc") (0) (by aesop)
#guard ¬(countDigits_postcond ("abc") (1) (by aesop))
#guard ¬(countDigits_postcond ("abc") (8) (by aesop))
#guard ¬(countDigits_postcond ("abc") (9) (by aesop))
#guard countDigits ("abc") (by aesop) = (0)
