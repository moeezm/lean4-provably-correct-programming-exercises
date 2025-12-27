import Aesop

/-
-----Description-----
This task requires writing a Lean 4 function that computes the length of the
longest strictly increasing contiguous subarray in a list of integers. A
subarray is a sequence of consecutive elements, and it is strictly increasing if
each element is greater than the previous one.

The function should correctly handle empty lists, lists with all equal
elements, and long stretches of increasing numbers.

-----Input-----
The input consists of a single list:
nums: A list of integers.

-----Output-----
The output is a natural number:
Returns the length of the longest strictly increasing contiguous subarray. If
the list is empty, the function should return 0.


-/

@[reducible, simp]
def longestIncreasingStreak_precond (nums : List Int) : Prop := sorry

def longestIncreasingStreak (nums : List Int) (h_precond : longestIncreasingStreak_precond nums) : Nat := sorry

@[reducible, simp]
def longestIncreasingStreak_postcond (nums : List Int) (result : Nat) (h_precond : longestIncreasingStreak_precond nums) : Prop := sorry

theorem longestIncreasingStreak_spec_satisfied (nums : List Int) (h_precond : longestIncreasingStreak_precond nums) :
    longestIncreasingStreak_postcond nums (longestIncreasingStreak nums h_precond) h_precond := by
  sorry

-- Test Guards

-- Test case 1
#guard longestIncreasingStreak_precond ([1, 2, 3, 2, 4, 5, 6])
#guard longestIncreasingStreak_postcond ([1, 2, 3, 2, 4, 5, 6]) (4) (by aesop)
#guard ¬(longestIncreasingStreak_postcond ([1, 2, 3, 2, 4, 5, 6]) (3) (by aesop))
#guard ¬(longestIncreasingStreak_postcond ([1, 2, 3, 2, 4, 5, 6]) (5) (by aesop))
#guard longestIncreasingStreak ([1, 2, 3, 2, 4, 5, 6]) (by aesop) = (4)

-- Test case 2
#guard longestIncreasingStreak_precond ([10, 20, 30, 40])
#guard longestIncreasingStreak_postcond ([10, 20, 30, 40]) (4) (by aesop)
#guard ¬(longestIncreasingStreak_postcond ([10, 20, 30, 40]) (3) (by aesop))
#guard longestIncreasingStreak ([10, 20, 30, 40]) (by aesop) = (4)

-- Test case 3
#guard longestIncreasingStreak_precond ([5, 5, 5, 5])
#guard longestIncreasingStreak_postcond ([5, 5, 5, 5]) (1) (by aesop)
#guard ¬(longestIncreasingStreak_postcond ([5, 5, 5, 5]) (0) (by aesop))
#guard ¬(longestIncreasingStreak_postcond ([5, 5, 5, 5]) (2) (by aesop))
#guard longestIncreasingStreak ([5, 5, 5, 5]) (by aesop) = (1)

-- Test case 4
#guard longestIncreasingStreak_precond ([10, 9, 8, 7])
#guard longestIncreasingStreak_postcond ([10, 9, 8, 7]) (1) (by aesop)
#guard ¬(longestIncreasingStreak_postcond ([10, 9, 8, 7]) (0) (by aesop))
#guard ¬(longestIncreasingStreak_postcond ([10, 9, 8, 7]) (2) (by aesop))
#guard longestIncreasingStreak ([10, 9, 8, 7]) (by aesop) = (1)

-- Test case 5
#guard longestIncreasingStreak_precond ([])
#guard longestIncreasingStreak_postcond ([]) (0) (by aesop)
#guard ¬(longestIncreasingStreak_postcond ([]) (1) (by aesop))
#guard longestIncreasingStreak ([]) (by aesop) = (0)

-- Test case 6
#guard longestIncreasingStreak_precond ([1, 2, 1, 2, 3, 0, 1, 2, 3, 4])
#guard longestIncreasingStreak_postcond ([1, 2, 1, 2, 3, 0, 1, 2, 3, 4]) (5) (by aesop)
#guard ¬(longestIncreasingStreak_postcond ([1, 2, 1, 2, 3, 0, 1, 2, 3, 4]) (4) (by aesop))
#guard longestIncreasingStreak ([1, 2, 1, 2, 3, 0, 1, 2, 3, 4]) (by aesop) = (5)
