import Aesop

/-
-----Description----- 
This task requires writing a Lean 4 method of which given a number n and
divisor d, it counts all the number that is smaller than
n whose sum of digits is divisible by d. 
-----Input-----
The input consists of three Nat:
n: Nat
d:Nat where d > 0

-----Output-----
The output is an Natural number:
Ensure this match the count that satisfy the property.


-/

@[reducible, simp]
def countSumDivisibleBy_precond (n : Nat) (d : Nat) : Prop := sorry

def countSumDivisibleBy (n : Nat) (d : Nat) (h_precond : countSumDivisibleBy_precond n d) : Nat := sorry

@[reducible, simp]
def countSumDivisibleBy_postcond (n : Nat) (d : Nat) (result : Nat) (h_precond : countSumDivisibleBy_precond n d) : Prop := sorry

theorem countSumDivisibleBy_spec_satisfied (n : Nat) (d : Nat) (h_precond : countSumDivisibleBy_precond n d) :
    countSumDivisibleBy_postcond n d (countSumDivisibleBy n d h_precond) h_precond := by
  sorry

-- Test Guards

-- Rejected inputs
#guard ¬(countSumDivisibleBy_precond (1) (0))

-- Test case 1
#guard countSumDivisibleBy_precond (0) (2)
#guard countSumDivisibleBy_postcond (0) (2) (0) (by aesop)
#guard ¬(countSumDivisibleBy_postcond (0) (2) (1) (by aesop))
#guard countSumDivisibleBy (0) (2) (by aesop) = (0)

-- Test case 2
#guard countSumDivisibleBy_precond (1) (2)
#guard countSumDivisibleBy_postcond (1) (2) (1) (by aesop)
#guard ¬(countSumDivisibleBy_postcond (1) (2) (0) (by aesop))
#guard countSumDivisibleBy (1) (2) (by aesop) = (1)

-- Test case 3
#guard countSumDivisibleBy_precond (10) (3)
#guard countSumDivisibleBy_postcond (10) (3) (4) (by aesop)
#guard ¬(countSumDivisibleBy_postcond (10) (3) (3) (by aesop))
#guard ¬(countSumDivisibleBy_postcond (10) (3) (5) (by aesop))
#guard countSumDivisibleBy (10) (3) (by aesop) = (4)

-- Test case 4
#guard countSumDivisibleBy_precond (12) (2)
#guard countSumDivisibleBy_postcond (12) (2) (6) (by aesop)
#guard ¬(countSumDivisibleBy_postcond (12) (2) (3) (by aesop))
#guard ¬(countSumDivisibleBy_postcond (12) (2) (5) (by aesop))
#guard countSumDivisibleBy (12) (2) (by aesop) = (6)

-- Test case 5
#guard countSumDivisibleBy_precond (20) (5)
#guard countSumDivisibleBy_postcond (20) (5) (4) (by aesop)
#guard ¬(countSumDivisibleBy_postcond (20) (5) (0) (by aesop))
#guard ¬(countSumDivisibleBy_postcond (20) (5) (10) (by aesop))
#guard countSumDivisibleBy (20) (5) (by aesop) = (4)
