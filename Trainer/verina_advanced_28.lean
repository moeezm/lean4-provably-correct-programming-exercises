import Aesop

/-
-----Description-----
This task requires writing a Lean 4 function that finds the length of the
longest sequence of consecutive integers present in a given list. The numbers do
not need to appear in order. The elements are unique.

A consecutive sequence consists of integers that can be arranged in increasing
order with no gaps. Your function should find the longest such streak.

-----Input-----
- nums: A list of integers (no duplicates).

-----Output-----
- A natural number: the length of the longest consecutive sequence.


-/

@[reducible, simp]
def longestConsecutive_precond (nums : List Int) : Prop := sorry

def longestConsecutive (nums : List Int) (h_precond : longestConsecutive_precond nums) : Nat := sorry

@[reducible, simp]
def longestConsecutive_postcond (nums : List Int) (result : Nat) (h_precond : longestConsecutive_precond nums) : Prop := sorry

theorem longestConsecutive_spec_satisfied (nums : List Int) (h_precond : longestConsecutive_precond nums) :
    longestConsecutive_postcond nums (longestConsecutive nums h_precond) h_precond := by
  sorry

-- Test Guards

-- Rejected inputs
#guard ¬(longestConsecutive_precond ([1, 1]))

-- Test case 1
#guard longestConsecutive_precond ([100, 4, 200, 1, 3, 2])
#guard longestConsecutive_postcond ([100, 4, 200, 1, 3, 2]) (4) (by aesop)
#guard ¬(longestConsecutive_postcond ([100, 4, 200, 1, 3, 2]) (3) (by aesop))
#guard ¬(longestConsecutive_postcond ([100, 4, 200, 1, 3, 2]) (5) (by aesop))
#guard longestConsecutive ([100, 4, 200, 1, 3, 2]) (by aesop) = (4)

-- Test case 2
#guard longestConsecutive_precond ([0, 3, 7, 2, 5, 8, 4, 6, 1])
#guard longestConsecutive_postcond ([0, 3, 7, 2, 5, 8, 4, 6, 1]) (9) (by aesop)
#guard ¬(longestConsecutive_postcond ([0, 3, 7, 2, 5, 8, 4, 6, 1]) (8) (by aesop))
#guard longestConsecutive ([0, 3, 7, 2, 5, 8, 4, 6, 1]) (by aesop) = (9)

-- Test case 3
#guard longestConsecutive_precond ([1, 2, 0])
#guard longestConsecutive_postcond ([1, 2, 0]) (3) (by aesop)
#guard ¬(longestConsecutive_postcond ([1, 2, 0]) (2) (by aesop))
#guard longestConsecutive ([1, 2, 0]) (by aesop) = (3)

-- Test case 4
#guard longestConsecutive_precond ([])
#guard longestConsecutive_postcond ([]) (0) (by aesop)
#guard ¬(longestConsecutive_postcond ([]) (1) (by aesop))
#guard longestConsecutive ([]) (by aesop) = (0)

-- Test case 5
#guard longestConsecutive_precond ([10])
#guard longestConsecutive_postcond ([10]) (1) (by aesop)
#guard ¬(longestConsecutive_postcond ([10]) (0) (by aesop))
#guard longestConsecutive ([10]) (by aesop) = (1)
