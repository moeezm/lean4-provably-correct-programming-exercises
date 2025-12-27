import Aesop

/-
-----Description----- 
This task requires writing a Lean 4 method that finds the length of the longest
strictly increasing subsequence from a given list of integers.

-----Input-----
The input consists of a list of integers called nums

-----Output-----
The output is an integer:
Returns a number representing the length of the longest strictly increasing
subsequence found in the input list.


-/

@[reducible, simp]
def longestIncreasingSubsequence_precond (nums : List Int) : Prop := sorry

def longestIncreasingSubsequence (nums : List Int) (h_precond : longestIncreasingSubsequence_precond nums) : Int := sorry

@[reducible, simp]
def longestIncreasingSubsequence_postcond (nums : List Int) (result : Int) (h_precond : longestIncreasingSubsequence_precond nums) : Prop := sorry

theorem longestIncreasingSubsequence_spec_satisfied (nums : List Int) (h_precond : longestIncreasingSubsequence_precond nums) :
    longestIncreasingSubsequence_postcond nums (longestIncreasingSubsequence nums h_precond) h_precond := by
  sorry

-- Test Guards

-- Test case 1
#guard longestIncreasingSubsequence_precond ([10, 9, 2, 5, 3, 7, 101, 18])
#guard longestIncreasingSubsequence_postcond ([10, 9, 2, 5, 3, 7, 101, 18]) (4) (by aesop)
#guard ¬(longestIncreasingSubsequence_postcond ([10, 9, 2, 5, 3, 7, 101, 18]) (3) (by aesop))
#guard ¬(longestIncreasingSubsequence_postcond ([10, 9, 2, 5, 3, 7, 101, 18]) (100) (by aesop))
#guard longestIncreasingSubsequence ([10, 9, 2, 5, 3, 7, 101, 18]) (by aesop) = (4)

-- Test case 2
#guard longestIncreasingSubsequence_precond ([0, 1, 0, 3, 2, 3])
#guard longestIncreasingSubsequence_postcond ([0, 1, 0, 3, 2, 3]) (4) (by aesop)
#guard ¬(longestIncreasingSubsequence_postcond ([0, 1, 0, 3, 2, 3]) (3) (by aesop))
#guard ¬(longestIncreasingSubsequence_postcond ([0, 1, 0, 3, 2, 3]) (100) (by aesop))
#guard longestIncreasingSubsequence ([0, 1, 0, 3, 2, 3]) (by aesop) = (4)

-- Test case 3
#guard longestIncreasingSubsequence_precond ([7, 7, 7, 7, 7, 7, 7])
#guard longestIncreasingSubsequence_postcond ([7, 7, 7, 7, 7, 7, 7]) (1) (by aesop)
#guard ¬(longestIncreasingSubsequence_postcond ([7, 7, 7, 7, 7, 7, 7]) (7) (by aesop))
#guard ¬(longestIncreasingSubsequence_postcond ([7, 7, 7, 7, 7, 7, 7]) (7) (by aesop))
#guard longestIncreasingSubsequence ([7, 7, 7, 7, 7, 7, 7]) (by aesop) = (1)

-- Test case 4
#guard longestIncreasingSubsequence_precond ([1, 3, 2, 4])
#guard longestIncreasingSubsequence_postcond ([1, 3, 2, 4]) (3) (by aesop)
#guard ¬(longestIncreasingSubsequence_postcond ([1, 3, 2, 4]) (2) (by aesop))
#guard ¬(longestIncreasingSubsequence_postcond ([1, 3, 2, 4]) (4) (by aesop))
#guard longestIncreasingSubsequence ([1, 3, 2, 4]) (by aesop) = (3)

-- Test case 5
#guard longestIncreasingSubsequence_precond ([10])
#guard longestIncreasingSubsequence_postcond ([10]) (1) (by aesop)
#guard ¬(longestIncreasingSubsequence_postcond ([10]) (0) (by aesop))
#guard longestIncreasingSubsequence ([10]) (by aesop) = (1)
