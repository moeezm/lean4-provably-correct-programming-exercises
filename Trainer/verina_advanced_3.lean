import Aesop

/-
-----Description----- 
This task requires writing a Lean 4 method that finds the length of the logest
common subsequence of two input arrays.

-----Input-----
The input consists of two arrays:
a: The first array.
b: The second array.


-----Output-----
The output is an integer:
Returns the length of array a and b's longest common subsequence.


-/

@[reducible, simp]
def LongestCommonSubsequence_precond (a : Array Int) (b : Array Int) : Prop := sorry

def LongestCommonSubsequence (a : Array Int) (b : Array Int) (h_precond : LongestCommonSubsequence_precond a b) : Int := sorry

@[reducible, simp]
def LongestCommonSubsequence_postcond (a : Array Int) (b : Array Int) (result : Int) (h_precond : LongestCommonSubsequence_precond a b) : Prop := sorry

theorem LongestCommonSubsequence_spec_satisfied (a : Array Int) (b : Array Int) (h_precond : LongestCommonSubsequence_precond a b) :
    LongestCommonSubsequence_postcond a b (LongestCommonSubsequence a b h_precond) h_precond := by
  sorry

-- Test Guards

-- Test case 1
#guard LongestCommonSubsequence_precond (#[1, 2, 3]) (#[1, 2, 3])
#guard LongestCommonSubsequence_postcond (#[1, 2, 3]) (#[1, 2, 3]) (3) (by aesop)
#guard ¬(LongestCommonSubsequence_postcond (#[1, 2, 3]) (#[1, 2, 3]) (2) (by aesop))
#guard ¬(LongestCommonSubsequence_postcond (#[1, 2, 3]) (#[1, 2, 3]) (4) (by aesop))
#guard LongestCommonSubsequence (#[1, 2, 3]) (#[1, 2, 3]) (by aesop) = (3)

-- Test case 2
#guard LongestCommonSubsequence_precond (#[1, 3, 5, 7]) (#[1, 2, 3, 4, 5, 6, 7])
#guard LongestCommonSubsequence_postcond (#[1, 3, 5, 7]) (#[1, 2, 3, 4, 5, 6, 7]) (4) (by aesop)
#guard ¬(LongestCommonSubsequence_postcond (#[1, 3, 5, 7]) (#[1, 2, 3, 4, 5, 6, 7]) (2) (by aesop))
#guard ¬(LongestCommonSubsequence_postcond (#[1, 3, 5, 7]) (#[1, 2, 3, 4, 5, 6, 7]) (5) (by aesop))
#guard LongestCommonSubsequence (#[1, 3, 5, 7]) (#[1, 2, 3, 4, 5, 6, 7]) (by aesop) = (4)

-- Test case 3
#guard LongestCommonSubsequence_precond (#[1, 2, 3]) (#[4, 5, 6])
#guard LongestCommonSubsequence_postcond (#[1, 2, 3]) (#[4, 5, 6]) (0) (by aesop)
#guard ¬(LongestCommonSubsequence_postcond (#[1, 2, 3]) (#[4, 5, 6]) (1) (by aesop))
#guard ¬(LongestCommonSubsequence_postcond (#[1, 2, 3]) (#[4, 5, 6]) (2) (by aesop))
#guard LongestCommonSubsequence (#[1, 2, 3]) (#[4, 5, 6]) (by aesop) = (0)

-- Test case 4
#guard LongestCommonSubsequence_precond (#[]) (#[1, 2, 3])
#guard LongestCommonSubsequence_postcond (#[]) (#[1, 2, 3]) (0) (by aesop)
#guard ¬(LongestCommonSubsequence_postcond (#[]) (#[1, 2, 3]) (1) (by aesop))
#guard LongestCommonSubsequence (#[]) (#[1, 2, 3]) (by aesop) = (0)

-- Test case 5
#guard LongestCommonSubsequence_precond (#[1, 2, 3, 4]) (#[2, 4, 6, 8])
#guard LongestCommonSubsequence_postcond (#[1, 2, 3, 4]) (#[2, 4, 6, 8]) (2) (by aesop)
#guard ¬(LongestCommonSubsequence_postcond (#[1, 2, 3, 4]) (#[2, 4, 6, 8]) (1) (by aesop))
#guard ¬(LongestCommonSubsequence_postcond (#[1, 2, 3, 4]) (#[2, 4, 6, 8]) (3) (by aesop))
#guard ¬(LongestCommonSubsequence_postcond (#[1, 2, 3, 4]) (#[2, 4, 6, 8]) (4) (by aesop))
#guard LongestCommonSubsequence (#[1, 2, 3, 4]) (#[2, 4, 6, 8]) (by aesop) = (2)
