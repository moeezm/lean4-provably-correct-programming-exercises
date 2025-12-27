import Aesop

/-
-----Description-----  
This task requires writing a Lean 4 method that extracts the last digit of a
given non-negative integer. The method should return the last digit, which is
obtained by computing the remainder when the number is divided by 10. The result
must always be between 0 and 9.

-----Input-----  
The input consists of a single value:  
n: A non-negative integer.

-----Output-----  
The output is an integer:  
Returns the last digit of the input number, ensuring that the digit lies within
the range 0 to 9.

-----Note-----  
It is assumed that the input number n is non-negative.
-/

@[reducible, simp]
def lastDigit_precond (n : Nat) : Prop := sorry

def lastDigit (n : Nat) (h_precond : lastDigit_precond n) : Nat := sorry

@[reducible, simp]
def lastDigit_postcond (n : Nat) (result : Nat) (h_precond : lastDigit_precond n) : Prop := sorry

theorem lastDigit_spec_satisfied (n : Nat) (h_precond : lastDigit_precond n) :
    lastDigit_postcond n (lastDigit n h_precond) h_precond := by
  sorry

-- Test Guards

-- Test case 1
#guard lastDigit_precond (123)
#guard lastDigit_postcond (123) (3) (by aesop)
#guard ¬(lastDigit_postcond (123) (2) (by aesop))
#guard ¬(lastDigit_postcond (123) (1) (by aesop))
#guard ¬(lastDigit_postcond (123) (23) (by aesop))
#guard lastDigit (123) (by aesop) = (3)

-- Test case 2
#guard lastDigit_precond (0)
#guard lastDigit_postcond (0) (0) (by aesop)
#guard ¬(lastDigit_postcond (0) (10) (by aesop))
#guard ¬(lastDigit_postcond (0) (5) (by aesop))
#guard ¬(lastDigit_postcond (0) (9) (by aesop))
#guard lastDigit (0) (by aesop) = (0)

-- Test case 3
#guard lastDigit_precond (987654321)
#guard lastDigit_postcond (987654321) (1) (by aesop)
#guard ¬(lastDigit_postcond (987654321) (9) (by aesop))
#guard ¬(lastDigit_postcond (987654321) (0) (by aesop))
#guard ¬(lastDigit_postcond (987654321) (2) (by aesop))
#guard lastDigit (987654321) (by aesop) = (1)

-- Test case 4
#guard lastDigit_precond (10)
#guard lastDigit_postcond (10) (0) (by aesop)
#guard ¬(lastDigit_postcond (10) (1) (by aesop))
#guard ¬(lastDigit_postcond (10) (10) (by aesop))
#guard ¬(lastDigit_postcond (10) (5) (by aesop))
#guard lastDigit (10) (by aesop) = (0)

-- Test case 5
#guard lastDigit_precond (999)
#guard lastDigit_postcond (999) (9) (by aesop)
#guard ¬(lastDigit_postcond (999) (8) (by aesop))
#guard ¬(lastDigit_postcond (999) (99) (by aesop))
#guard ¬(lastDigit_postcond (999) (0) (by aesop))
#guard lastDigit (999) (by aesop) = (9)

-- Test case 6
#guard lastDigit_precond (45)
#guard lastDigit_postcond (45) (5) (by aesop)
#guard ¬(lastDigit_postcond (45) (4) (by aesop))
#guard ¬(lastDigit_postcond (45) (0) (by aesop))
#guard ¬(lastDigit_postcond (45) (55) (by aesop))
#guard lastDigit (45) (by aesop) = (5)

-- Test case 7
#guard lastDigit_precond (100)
#guard lastDigit_postcond (100) (0) (by aesop)
#guard ¬(lastDigit_postcond (100) (1) (by aesop))
#guard ¬(lastDigit_postcond (100) (10) (by aesop))
#guard ¬(lastDigit_postcond (100) (5) (by aesop))
#guard lastDigit (100) (by aesop) = (0)

-- Test case 8
#guard lastDigit_precond (5)
#guard lastDigit_postcond (5) (5) (by aesop)
#guard ¬(lastDigit_postcond (5) (4) (by aesop))
#guard ¬(lastDigit_postcond (5) (0) (by aesop))
#guard ¬(lastDigit_postcond (5) (6) (by aesop))
#guard lastDigit (5) (by aesop) = (5)
