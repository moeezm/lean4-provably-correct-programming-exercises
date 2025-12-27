import Aesop

/-
-----Description----- 
This test implements a function in Lean 4 that finds the length of the longest
increasing subsequence in a list of integers. A subsequence is a sequence that
can be derived from another sequence by deleting some or no elements without
changing the order of the remaining elements. An increasing subsequence is one
in which the elements are in strictly increasing order.

-----Input-----
numbers: A list of integers.

-----Output-----
A natural number representing the length of the longest increasing subsequence
in the input list. If the list is empty, the function returns 0.


-/

@[reducible, simp]
def longestIncreasingSubsequence_precond (numbers : List Int) : Prop := sorry

def longestIncreasingSubsequence (numbers : List Int) (h_precond : longestIncreasingSubsequence_precond numbers) : Nat := sorry

@[reducible, simp]
def longestIncreasingSubsequence_postcond (numbers : List Int) (result : Nat) (h_precond : longestIncreasingSubsequence_precond numbers) : Prop := sorry

theorem longestIncreasingSubsequence_spec_satisfied (numbers : List Int) (h_precond : longestIncreasingSubsequence_precond numbers) :
    longestIncreasingSubsequence_postcond numbers (longestIncreasingSubsequence numbers h_precond) h_precond := by
  sorry

-- Test Guards

-- Test case 1
#guard longestIncreasingSubsequence_precond ([10, 22, 9, 33, 21, 50, 41, 60])
#guard longestIncreasingSubsequence_postcond ([10, 22, 9, 33, 21, 50, 41, 60]) (5) (by aesop)
#guard ¬(longestIncreasingSubsequence_postcond ([10, 22, 9, 33, 21, 50, 41, 60]) (4) (by aesop))
#guard ¬(longestIncreasingSubsequence_postcond ([10, 22, 9, 33, 21, 50, 41, 60]) (6) (by aesop))
#guard ¬(longestIncreasingSubsequence_postcond ([10, 22, 9, 33, 21, 50, 41, 60]) (8) (by aesop))
#guard longestIncreasingSubsequence ([10, 22, 9, 33, 21, 50, 41, 60]) (by aesop) = (5)

-- Test case 2
#guard longestIncreasingSubsequence_precond ([3, 10, 2, 1, 20])
#guard longestIncreasingSubsequence_postcond ([3, 10, 2, 1, 20]) (3) (by aesop)
#guard ¬(longestIncreasingSubsequence_postcond ([3, 10, 2, 1, 20]) (2) (by aesop))
#guard ¬(longestIncreasingSubsequence_postcond ([3, 10, 2, 1, 20]) (4) (by aesop))
#guard ¬(longestIncreasingSubsequence_postcond ([3, 10, 2, 1, 20]) (5) (by aesop))
#guard longestIncreasingSubsequence ([3, 10, 2, 1, 20]) (by aesop) = (3)

-- Test case 3
#guard longestIncreasingSubsequence_precond ([50, 3, 10, 7, 40, 80])
#guard longestIncreasingSubsequence_postcond ([50, 3, 10, 7, 40, 80]) (4) (by aesop)
#guard ¬(longestIncreasingSubsequence_postcond ([50, 3, 10, 7, 40, 80]) (3) (by aesop))
#guard ¬(longestIncreasingSubsequence_postcond ([50, 3, 10, 7, 40, 80]) (5) (by aesop))
#guard ¬(longestIncreasingSubsequence_postcond ([50, 3, 10, 7, 40, 80]) (6) (by aesop))
#guard longestIncreasingSubsequence ([50, 3, 10, 7, 40, 80]) (by aesop) = (4)

-- Test case 4
#guard longestIncreasingSubsequence_precond ([10, 9, 8, 7, 6, 5, 4, 3, 2, 1])
#guard longestIncreasingSubsequence_postcond ([10, 9, 8, 7, 6, 5, 4, 3, 2, 1]) (1) (by aesop)
#guard ¬(longestIncreasingSubsequence_postcond ([10, 9, 8, 7, 6, 5, 4, 3, 2, 1]) (0) (by aesop))
#guard ¬(longestIncreasingSubsequence_postcond ([10, 9, 8, 7, 6, 5, 4, 3, 2, 1]) (2) (by aesop))
#guard ¬(longestIncreasingSubsequence_postcond ([10, 9, 8, 7, 6, 5, 4, 3, 2, 1]) (10) (by aesop))
#guard longestIncreasingSubsequence ([10, 9, 8, 7, 6, 5, 4, 3, 2, 1]) (by aesop) = (1)

-- Test case 5
#guard longestIncreasingSubsequence_precond ([1, 2, 3, 4, 5])
#guard longestIncreasingSubsequence_postcond ([1, 2, 3, 4, 5]) (5) (by aesop)
#guard ¬(longestIncreasingSubsequence_postcond ([1, 2, 3, 4, 5]) (1) (by aesop))
#guard ¬(longestIncreasingSubsequence_postcond ([1, 2, 3, 4, 5]) (4) (by aesop))
#guard ¬(longestIncreasingSubsequence_postcond ([1, 2, 3, 4, 5]) (6) (by aesop))
#guard longestIncreasingSubsequence ([1, 2, 3, 4, 5]) (by aesop) = (5)

-- Test case 6
#guard longestIncreasingSubsequence_precond ([])
#guard longestIncreasingSubsequence_postcond ([]) (0) (by aesop)
#guard ¬(longestIncreasingSubsequence_postcond ([]) (1) (by aesop))
#guard ¬(longestIncreasingSubsequence_postcond ([]) (2) (by aesop))
#guard ¬(longestIncreasingSubsequence_postcond ([]) (3) (by aesop))
#guard longestIncreasingSubsequence ([]) (by aesop) = (0)

-- Test case 7
#guard longestIncreasingSubsequence_precond ([5])
#guard longestIncreasingSubsequence_postcond ([5]) (1) (by aesop)
#guard ¬(longestIncreasingSubsequence_postcond ([5]) (0) (by aesop))
#guard ¬(longestIncreasingSubsequence_postcond ([5]) (2) (by aesop))
#guard longestIncreasingSubsequence ([5]) (by aesop) = (1)

-- Test case 8
#guard longestIncreasingSubsequence_precond ([5, 5, 5, 5])
#guard longestIncreasingSubsequence_postcond ([5, 5, 5, 5]) (1) (by aesop)
#guard ¬(longestIncreasingSubsequence_postcond ([5, 5, 5, 5]) (0) (by aesop))
#guard ¬(longestIncreasingSubsequence_postcond ([5, 5, 5, 5]) (4) (by aesop))
#guard longestIncreasingSubsequence ([5, 5, 5, 5]) (by aesop) = (1)
