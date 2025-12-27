import Aesop

/-
-----Description-----
This task requires implementing the "Longest Increasing Subsequence" problem in
Lean 4.
Given a list of integers, the function should compute the length of the longest
strictly increasing
subsequence. A subsequence is formed by deleting zero or more elements without
changing the order.
If the list is empty, the function should return 0.

-----Input-----
- nums: A list of integers.

-----Output-----
- A natural number representing the length of the longest strictly increasing
subsequence.
- If there is no increasing subsequence, return 0.


-/

@[reducible, simp]
def longestIncreasingSubsequence_precond (nums : List Int) : Prop := sorry

def longestIncreasingSubsequence (nums : List Int) (h_precond : longestIncreasingSubsequence_precond nums) : Nat := sorry

@[reducible, simp]
def longestIncreasingSubsequence_postcond (nums : List Int) (result : Nat) (h_precond : longestIncreasingSubsequence_precond nums) : Prop := sorry

theorem longestIncreasingSubsequence_spec_satisfied (nums : List Int) (h_precond : longestIncreasingSubsequence_precond nums) :
    longestIncreasingSubsequence_postcond nums (longestIncreasingSubsequence nums h_precond) h_precond := by
  sorry

-- Test Guards

-- Test case 1
#guard longestIncreasingSubsequence_precond ([10, 9, 2, 5, 3, 7, 101, 18])
#guard longestIncreasingSubsequence_postcond ([10, 9, 2, 5, 3, 7, 101, 18]) (4) (by aesop)
#guard ¬(longestIncreasingSubsequence_postcond ([10, 9, 2, 5, 3, 7, 101, 18]) (3) (by aesop))
#guard ¬(longestIncreasingSubsequence_postcond ([10, 9, 2, 5, 3, 7, 101, 18]) (5) (by aesop))
#guard longestIncreasingSubsequence ([10, 9, 2, 5, 3, 7, 101, 18]) (by aesop) = (4)

-- Test case 2
#guard longestIncreasingSubsequence_precond ([0, 1, 0, 3, 2, 3])
#guard longestIncreasingSubsequence_postcond ([0, 1, 0, 3, 2, 3]) (4) (by aesop)
#guard ¬(longestIncreasingSubsequence_postcond ([0, 1, 0, 3, 2, 3]) (3) (by aesop))
#guard longestIncreasingSubsequence ([0, 1, 0, 3, 2, 3]) (by aesop) = (4)

-- Test case 3
#guard longestIncreasingSubsequence_precond ([7, 7, 7, 7, 7])
#guard longestIncreasingSubsequence_postcond ([7, 7, 7, 7, 7]) (1) (by aesop)
#guard ¬(longestIncreasingSubsequence_postcond ([7, 7, 7, 7, 7]) (0) (by aesop))
#guard ¬(longestIncreasingSubsequence_postcond ([7, 7, 7, 7, 7]) (2) (by aesop))
#guard longestIncreasingSubsequence ([7, 7, 7, 7, 7]) (by aesop) = (1)

-- Test case 4
#guard longestIncreasingSubsequence_precond ([])
#guard longestIncreasingSubsequence_postcond ([]) (0) (by aesop)
#guard ¬(longestIncreasingSubsequence_postcond ([]) (1) (by aesop))
#guard longestIncreasingSubsequence ([]) (by aesop) = (0)

-- Test case 5
#guard longestIncreasingSubsequence_precond ([4, 10, 4, 3, 8, 9])
#guard longestIncreasingSubsequence_postcond ([4, 10, 4, 3, 8, 9]) (3) (by aesop)
#guard ¬(longestIncreasingSubsequence_postcond ([4, 10, 4, 3, 8, 9]) (2) (by aesop))
#guard ¬(longestIncreasingSubsequence_postcond ([4, 10, 4, 3, 8, 9]) (4) (by aesop))
#guard longestIncreasingSubsequence ([4, 10, 4, 3, 8, 9]) (by aesop) = (3)
