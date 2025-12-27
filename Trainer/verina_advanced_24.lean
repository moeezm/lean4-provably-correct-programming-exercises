import Aesop

/-
-----Description-----
This task requires writing a Lean 4 method that determines the length of the
longest strictly increasing subsequence in a given array of integers.

A subsequence is a sequence that can be derived from the array by deleting some
or no elements without changing the order of the remaining elements. The
subsequence must be strictly increasing, meaning each element must be greater
than the one before it.

The goal is to find the length of the longest such subsequence that can be
formed from the input array.

-----Input-----
The input consists of one array:

nums: An array of integers where nums[i] represents the ith element of the
input sequence.

-----Output-----
The output is an integer:
Returns the length of the longest strictly increasing subsequence in the input
array.


-/

@[reducible, simp]
def lengthOfLIS_precond (nums : List Int) : Prop := sorry

def lengthOfLIS (nums : List Int) (h_precond : lengthOfLIS_precond nums) : Int := sorry

@[reducible, simp]
def lengthOfLIS_postcond (nums : List Int) (result : Int) (h_precond : lengthOfLIS_precond nums) : Prop := sorry

theorem lengthOfLIS_spec_satisfied (nums : List Int) (h_precond : lengthOfLIS_precond nums) :
    lengthOfLIS_postcond nums (lengthOfLIS nums h_precond) h_precond := by
  sorry

-- Test Guards

-- Test case 1
#guard lengthOfLIS_precond ([10, 9, 2, 5, 3, 7, 101, 18])
#guard lengthOfLIS_postcond ([10, 9, 2, 5, 3, 7, 101, 18]) (4) (by aesop)
#guard ¬(lengthOfLIS_postcond ([10, 9, 2, 5, 3, 7, 101, 18]) (1) (by aesop))
#guard ¬(lengthOfLIS_postcond ([10, 9, 2, 5, 3, 7, 101, 18]) (2) (by aesop))
#guard ¬(lengthOfLIS_postcond ([10, 9, 2, 5, 3, 7, 101, 18]) (8) (by aesop))
#guard lengthOfLIS ([10, 9, 2, 5, 3, 7, 101, 18]) (by aesop) = (4)

-- Test case 2
#guard lengthOfLIS_precond ([0, 1, 0, 3, 2, 3])
#guard lengthOfLIS_postcond ([0, 1, 0, 3, 2, 3]) (4) (by aesop)
#guard ¬(lengthOfLIS_postcond ([0, 1, 0, 3, 2, 3]) (1) (by aesop))
#guard ¬(lengthOfLIS_postcond ([0, 1, 0, 3, 2, 3]) (3) (by aesop))
#guard ¬(lengthOfLIS_postcond ([0, 1, 0, 3, 2, 3]) (6) (by aesop))
#guard lengthOfLIS ([0, 1, 0, 3, 2, 3]) (by aesop) = (4)

-- Test case 3
#guard lengthOfLIS_precond ([7, 7, 7, 7, 7, 7, 7])
#guard lengthOfLIS_postcond ([7, 7, 7, 7, 7, 7, 7]) (1) (by aesop)
#guard ¬(lengthOfLIS_postcond ([7, 7, 7, 7, 7, 7, 7]) (0) (by aesop))
#guard ¬(lengthOfLIS_postcond ([7, 7, 7, 7, 7, 7, 7]) (6) (by aesop))
#guard ¬(lengthOfLIS_postcond ([7, 7, 7, 7, 7, 7, 7]) (7) (by aesop))
#guard lengthOfLIS ([7, 7, 7, 7, 7, 7, 7]) (by aesop) = (1)

-- Test case 4
#guard lengthOfLIS_precond ([4, 10, 4, 3, 8, 9])
#guard lengthOfLIS_postcond ([4, 10, 4, 3, 8, 9]) (3) (by aesop)
#guard ¬(lengthOfLIS_postcond ([4, 10, 4, 3, 8, 9]) (1) (by aesop))
#guard ¬(lengthOfLIS_postcond ([4, 10, 4, 3, 8, 9]) (2) (by aesop))
#guard ¬(lengthOfLIS_postcond ([4, 10, 4, 3, 8, 9]) (6) (by aesop))
#guard lengthOfLIS ([4, 10, 4, 3, 8, 9]) (by aesop) = (3)

-- Test case 5
#guard lengthOfLIS_precond ([1, 3, 6, 7, 9, 4, 10, 5, 6])
#guard lengthOfLIS_postcond ([1, 3, 6, 7, 9, 4, 10, 5, 6]) (6) (by aesop)
#guard ¬(lengthOfLIS_postcond ([1, 3, 6, 7, 9, 4, 10, 5, 6]) (1) (by aesop))
#guard ¬(lengthOfLIS_postcond ([1, 3, 6, 7, 9, 4, 10, 5, 6]) (4) (by aesop))
#guard ¬(lengthOfLIS_postcond ([1, 3, 6, 7, 9, 4, 10, 5, 6]) (9) (by aesop))
#guard lengthOfLIS ([1, 3, 6, 7, 9, 4, 10, 5, 6]) (by aesop) = (6)
