import Aesop

/-
-----Description----- 
This task requires writing a Lean 4 method that returns the smallest natural
number missing from a given sorted list of natural numbers. In other words,
starting from 0, the method should identify the first natural number that does
not appear in the list. The input list is assumed to be sorted in non-decreasing
order and contains only natural numbers (including 0).

-----Input-----
The input consists of:
s: A list of natural numbers sorted in non-decreasing order.

-----Output-----
The output is a natural number:
Returns the smallest natural number that does not appear in the input list.

-----Note-----
It is assumed that the input list is sorted and contains only natural numbers.
-/

@[reducible, simp]
def smallestMissingNumber_precond (s : List Nat) : Prop := sorry

def smallestMissingNumber (s : List Nat) (h_precond : smallestMissingNumber_precond s) : Nat := sorry

@[reducible, simp]
def smallestMissingNumber_postcond (s : List Nat) (result : Nat) (h_precond : smallestMissingNumber_precond s) : Prop := sorry

theorem smallestMissingNumber_spec_satisfied (s : List Nat) (h_precond : smallestMissingNumber_precond s) :
    smallestMissingNumber_postcond s (smallestMissingNumber s h_precond) h_precond := by
  sorry

-- Test Guards

-- Rejected inputs
#guard ¬(smallestMissingNumber_precond ([3, 2, 1]))

-- Test case 1
#guard smallestMissingNumber_precond ([0, 1, 2, 6, 9])
#guard smallestMissingNumber_postcond ([0, 1, 2, 6, 9]) (3) (by aesop)
#guard ¬(smallestMissingNumber_postcond ([0, 1, 2, 6, 9]) (2) (by aesop))
#guard ¬(smallestMissingNumber_postcond ([0, 1, 2, 6, 9]) (4) (by aesop))
#guard ¬(smallestMissingNumber_postcond ([0, 1, 2, 6, 9]) (5) (by aesop))
#guard smallestMissingNumber ([0, 1, 2, 6, 9]) (by aesop) = (3)

-- Test case 2
#guard smallestMissingNumber_precond ([4, 5, 10, 11])
#guard smallestMissingNumber_postcond ([4, 5, 10, 11]) (0) (by aesop)
#guard ¬(smallestMissingNumber_postcond ([4, 5, 10, 11]) (1) (by aesop))
#guard ¬(smallestMissingNumber_postcond ([4, 5, 10, 11]) (2) (by aesop))
#guard smallestMissingNumber ([4, 5, 10, 11]) (by aesop) = (0)

-- Test case 3
#guard smallestMissingNumber_precond ([0, 1, 2, 3, 4, 5])
#guard smallestMissingNumber_postcond ([0, 1, 2, 3, 4, 5]) (6) (by aesop)
#guard ¬(smallestMissingNumber_postcond ([0, 1, 2, 3, 4, 5]) (5) (by aesop))
#guard ¬(smallestMissingNumber_postcond ([0, 1, 2, 3, 4, 5]) (7) (by aesop))
#guard smallestMissingNumber ([0, 1, 2, 3, 4, 5]) (by aesop) = (6)

-- Test case 4
#guard smallestMissingNumber_precond ([])
#guard smallestMissingNumber_postcond ([]) (0) (by aesop)
#guard ¬(smallestMissingNumber_postcond ([]) (1) (by aesop))
#guard ¬(smallestMissingNumber_postcond ([]) (2) (by aesop))
#guard smallestMissingNumber ([]) (by aesop) = (0)

-- Test case 5
#guard smallestMissingNumber_precond ([0, 2, 3, 4])
#guard smallestMissingNumber_postcond ([0, 2, 3, 4]) (1) (by aesop)
#guard ¬(smallestMissingNumber_postcond ([0, 2, 3, 4]) (0) (by aesop))
#guard ¬(smallestMissingNumber_postcond ([0, 2, 3, 4]) (2) (by aesop))
#guard ¬(smallestMissingNumber_postcond ([0, 2, 3, 4]) (3) (by aesop))
#guard smallestMissingNumber ([0, 2, 3, 4]) (by aesop) = (1)
