import Aesop

/-
-----Description-----
This task requires writing a Lean 4 function that returns the nth "ugly
number". Ugly numbers are positive integers whose only prime factors are 2, 3,
or 5.

The function should generate ugly numbers in ascending order and return the nth
one. The first ugly number is 1.

-----Input-----
The input is a natural number:

n: The index (1-based) of the ugly number to return.

-----Output-----
The output is a natural number:
The nth smallest ugly number.


-/

@[reducible, simp]
def nthUglyNumber_precond (n : Nat) : Prop := sorry

def nthUglyNumber (n : Nat) (h_precond : nthUglyNumber_precond n) : Nat := sorry

@[reducible, simp]
def nthUglyNumber_postcond (n : Nat) (result : Nat) (h_precond : nthUglyNumber_precond n) : Prop := sorry

theorem nthUglyNumber_spec_satisfied (n : Nat) (h_precond : nthUglyNumber_precond n) :
    nthUglyNumber_postcond n (nthUglyNumber n h_precond) h_precond := by
  sorry

-- Test Guards

-- Test case 1
#guard nthUglyNumber_precond (1)
#guard nthUglyNumber_postcond (1) (1) (by aesop)
#guard ¬(nthUglyNumber_postcond (1) (0) (by aesop))
#guard ¬(nthUglyNumber_postcond (1) (2) (by aesop))
#guard nthUglyNumber (1) (by aesop) = (1)

-- Test case 2
#guard nthUglyNumber_precond (10)
#guard nthUglyNumber_postcond (10) (12) (by aesop)
#guard ¬(nthUglyNumber_postcond (10) (13) (by aesop))
#guard ¬(nthUglyNumber_postcond (10) (10) (by aesop))
#guard ¬(nthUglyNumber_postcond (10) (15) (by aesop))
#guard nthUglyNumber (10) (by aesop) = (12)

-- Test case 3
#guard nthUglyNumber_precond (15)
#guard nthUglyNumber_postcond (15) (24) (by aesop)
#guard ¬(nthUglyNumber_postcond (15) (20) (by aesop))
#guard ¬(nthUglyNumber_postcond (15) (25) (by aesop))
#guard nthUglyNumber (15) (by aesop) = (24)

-- Test case 4
#guard nthUglyNumber_precond (5)
#guard nthUglyNumber_postcond (5) (5) (by aesop)
#guard ¬(nthUglyNumber_postcond (5) (6) (by aesop))
#guard ¬(nthUglyNumber_postcond (5) (7) (by aesop))
#guard nthUglyNumber (5) (by aesop) = (5)

-- Test case 5
#guard nthUglyNumber_precond (7)
#guard nthUglyNumber_postcond (7) (8) (by aesop)
#guard ¬(nthUglyNumber_postcond (7) (9) (by aesop))
#guard ¬(nthUglyNumber_postcond (7) (10) (by aesop))
#guard nthUglyNumber (7) (by aesop) = (8)
