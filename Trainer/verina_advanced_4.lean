import Aesop

/-
-----Description----- 
This task requires writing a Lean 4 method that finds the length of the longest
increasing sequence in a given array. The method should return the length of the
longest increasing subsequence, in which every element is strictly less than the
latter element.

-----Input-----
The input consists of an arrat:
a: The input array.

-----Output-----
The output is an integer:
Returns the length of the longest increasing subsequence, assuring that it is a
subsequence of the input sequence and that every element in it is strictly less
than the latter one.


-/

@[reducible, simp]
def LongestIncreasingSubsequence_precond (a : Array Int) : Prop := sorry

def LongestIncreasingSubsequence (a : Array Int) (h_precond : LongestIncreasingSubsequence_precond a) : Int := sorry

@[reducible, simp]
def LongestIncreasingSubsequence_postcond (a : Array Int) (result : Int) (h_precond : LongestIncreasingSubsequence_precond a) : Prop := sorry

theorem LongestIncreasingSubsequence_spec_satisfied (a : Array Int) (h_precond : LongestIncreasingSubsequence_precond a) :
    LongestIncreasingSubsequence_postcond a (LongestIncreasingSubsequence a h_precond) h_precond := by
  sorry

-- Test Guards

-- Test case 1
#guard LongestIncreasingSubsequence_precond (#[5, 2, 8, 6, 3, 6, 9, 7])
#guard LongestIncreasingSubsequence_postcond (#[5, 2, 8, 6, 3, 6, 9, 7]) (4) (by aesop)
#guard ¬(LongestIncreasingSubsequence_postcond (#[5, 2, 8, 6, 3, 6, 9, 7]) (2) (by aesop))
#guard ¬(LongestIncreasingSubsequence_postcond (#[5, 2, 8, 6, 3, 6, 9, 7]) (3) (by aesop))
#guard LongestIncreasingSubsequence (#[5, 2, 8, 6, 3, 6, 9, 7]) (by aesop) = (4)

-- Test case 2
#guard LongestIncreasingSubsequence_precond (#[3, 1, 2, 1, 0])
#guard LongestIncreasingSubsequence_postcond (#[3, 1, 2, 1, 0]) (2) (by aesop)
#guard ¬(LongestIncreasingSubsequence_postcond (#[3, 1, 2, 1, 0]) (1) (by aesop))
#guard ¬(LongestIncreasingSubsequence_postcond (#[3, 1, 2, 1, 0]) (3) (by aesop))
#guard LongestIncreasingSubsequence (#[3, 1, 2, 1, 0]) (by aesop) = (2)

-- Test case 3
#guard LongestIncreasingSubsequence_precond (#[2, 3, -2, -1, 7, 19, 3, 6, -4, 6, -7, 0, 9, 12, 10])
#guard LongestIncreasingSubsequence_postcond (#[2, 3, -2, -1, 7, 19, 3, 6, -4, 6, -7, 0, 9, 12, 10]) (6) (by aesop)
#guard ¬(LongestIncreasingSubsequence_postcond (#[2, 3, -2, -1, 7, 19, 3, 6, -4, 6, -7, 0, 9, 12, 10]) (5) (by aesop))
#guard ¬(LongestIncreasingSubsequence_postcond (#[2, 3, -2, -1, 7, 19, 3, 6, -4, 6, -7, 0, 9, 12, 10]) (3) (by aesop))
#guard ¬(LongestIncreasingSubsequence_postcond (#[2, 3, -2, -1, 7, 19, 3, 6, -4, 6, -7, 0, 9, 12, 10]) (10) (by aesop))
#guard LongestIncreasingSubsequence (#[2, 3, -2, -1, 7, 19, 3, 6, -4, 6, -7, 0, 9, 12, 10]) (by aesop) = (6)

-- Test case 4
#guard LongestIncreasingSubsequence_precond (#[5, -5, -3, 2, 4, 1, 0, -1, 3, 2, 0])
#guard LongestIncreasingSubsequence_postcond (#[5, -5, -3, 2, 4, 1, 0, -1, 3, 2, 0]) (4) (by aesop)
#guard ¬(LongestIncreasingSubsequence_postcond (#[5, -5, -3, 2, 4, 1, 0, -1, 3, 2, 0]) (2) (by aesop))
#guard ¬(LongestIncreasingSubsequence_postcond (#[5, -5, -3, 2, 4, 1, 0, -1, 3, 2, 0]) (5) (by aesop))
#guard LongestIncreasingSubsequence (#[5, -5, -3, 2, 4, 1, 0, -1, 3, 2, 0]) (by aesop) = (4)

-- Test case 5
#guard LongestIncreasingSubsequence_precond (#[1, 7, 23, 14, -4, 21, 8, 2, -1, 9, 12, 2])
#guard LongestIncreasingSubsequence_postcond (#[1, 7, 23, 14, -4, 21, 8, 2, -1, 9, 12, 2]) (5) (by aesop)
#guard ¬(LongestIncreasingSubsequence_postcond (#[1, 7, 23, 14, -4, 21, 8, 2, -1, 9, 12, 2]) (2) (by aesop))
#guard ¬(LongestIncreasingSubsequence_postcond (#[1, 7, 23, 14, -4, 21, 8, 2, -1, 9, 12, 2]) (4) (by aesop))
#guard LongestIncreasingSubsequence (#[1, 7, 23, 14, -4, 21, 8, 2, -1, 9, 12, 2]) (by aesop) = (5)

-- Test case 6
#guard LongestIncreasingSubsequence_precond (#[])
#guard LongestIncreasingSubsequence_postcond (#[]) (0) (by aesop)
#guard ¬(LongestIncreasingSubsequence_postcond (#[]) (1) (by aesop))
#guard ¬(LongestIncreasingSubsequence_postcond (#[]) (2) (by aesop))
#guard LongestIncreasingSubsequence (#[]) (by aesop) = (0)
