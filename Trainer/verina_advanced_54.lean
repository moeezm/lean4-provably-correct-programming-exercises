import Aesop

/-
-----Description-----
This task requires writing a Lean 4 function that finds the one missing number
in a list of distinct natural numbers from 0 to n. The list contains exactly n
numbers and all numbers are in the range [0, n], but one number in that range is
missing.

Your function must return the missing number. You may assume the input list
contains no duplicates and only one number is missing.

-----Input-----
- nums: A list of natural numbers of length n, each in the range [0, n] with
exactly one number missing.

-----Output-----
- A natural number: the missing number in the range [0, n] not present in the
list.


-/

@[reducible, simp]
def missingNumber_precond (nums : List Nat) : Prop := sorry

def missingNumber (nums : List Nat) (h_precond : missingNumber_precond nums) : Nat := sorry

@[reducible, simp]
def missingNumber_postcond (nums : List Nat) (result : Nat) (h_precond : missingNumber_precond nums) : Prop := sorry

theorem missingNumber_spec_satisfied (nums : List Nat) (h_precond : missingNumber_precond nums) :
    missingNumber_postcond nums (missingNumber nums h_precond) h_precond := by
  sorry

-- Test Guards

-- Rejected inputs
#guard ¬(missingNumber_precond ([0, 0, 1]))

-- Test case 1
#guard missingNumber_precond ([3, 0, 1])
#guard missingNumber_postcond ([3, 0, 1]) (2) (by aesop)
#guard ¬(missingNumber_postcond ([3, 0, 1]) (0) (by aesop))
#guard ¬(missingNumber_postcond ([3, 0, 1]) (1) (by aesop))
#guard ¬(missingNumber_postcond ([3, 0, 1]) (3) (by aesop))
#guard missingNumber ([3, 0, 1]) (by aesop) = (2)

-- Test case 2
#guard missingNumber_precond ([0, 1])
#guard missingNumber_postcond ([0, 1]) (2) (by aesop)
#guard ¬(missingNumber_postcond ([0, 1]) (0) (by aesop))
#guard ¬(missingNumber_postcond ([0, 1]) (1) (by aesop))
#guard missingNumber ([0, 1]) (by aesop) = (2)

-- Test case 3
#guard missingNumber_precond ([9, 6, 4, 2, 3, 5, 7, 0, 1])
#guard missingNumber_postcond ([9, 6, 4, 2, 3, 5, 7, 0, 1]) (8) (by aesop)
#guard ¬(missingNumber_postcond ([9, 6, 4, 2, 3, 5, 7, 0, 1]) (1) (by aesop))
#guard ¬(missingNumber_postcond ([9, 6, 4, 2, 3, 5, 7, 0, 1]) (9) (by aesop))
#guard missingNumber ([9, 6, 4, 2, 3, 5, 7, 0, 1]) (by aesop) = (8)

-- Test case 4
#guard missingNumber_precond ([0])
#guard missingNumber_postcond ([0]) (1) (by aesop)
#guard ¬(missingNumber_postcond ([0]) (0) (by aesop))
#guard missingNumber ([0]) (by aesop) = (1)

-- Test case 5
#guard missingNumber_precond ([1])
#guard missingNumber_postcond ([1]) (0) (by aesop)
#guard ¬(missingNumber_postcond ([1]) (1) (by aesop))
#guard missingNumber ([1]) (by aesop) = (0)
