import Aesop

/-
-----Description----- 
This task requires implementing a Lean 4 method that finds the length of the
longest strictly increasing subsequence in an array of integers. A subsequence
is a sequence that can be derived from an array by deleting some or no elements
without changing the order of the remaining elements.

-----Input-----
The input consists of one parameter:
nums: A list of integers representing the input array.

-----Output-----
The output is an integer:
Returns the length of the longest strictly increasing subsequence in the input
array.


-/

@[reducible, simp]
def lengthOfLIS_precond (nums : List Int) : Prop := sorry

def lengthOfLIS (nums : List Int) (h_precond : lengthOfLIS_precond nums) : Nat := sorry

@[reducible, simp]
def lengthOfLIS_postcond (nums : List Int) (result : Nat) (h_precond : lengthOfLIS_precond nums) : Prop := sorry

theorem lengthOfLIS_spec_satisfied (nums : List Int) (h_precond : lengthOfLIS_precond nums) :
    lengthOfLIS_postcond nums (lengthOfLIS nums h_precond) h_precond := by
  sorry

-- Test Guards

-- Test case 1
#guard lengthOfLIS_precond ([10, 9, 2, 5, 3, 7, 101, 18])
#guard lengthOfLIS_postcond ([10, 9, 2, 5, 3, 7, 101, 18]) (4) (by aesop)
#guard ¬(lengthOfLIS_postcond ([10, 9, 2, 5, 3, 7, 101, 18]) (3) (by aesop))
#guard ¬(lengthOfLIS_postcond ([10, 9, 2, 5, 3, 7, 101, 18]) (5) (by aesop))
#guard ¬(lengthOfLIS_postcond ([10, 9, 2, 5, 3, 7, 101, 18]) (8) (by aesop))
#guard lengthOfLIS ([10, 9, 2, 5, 3, 7, 101, 18]) (by aesop) = (4)

-- Test case 2
#guard lengthOfLIS_precond ([0, 1, 0, 3, 2, 3])
#guard lengthOfLIS_postcond ([0, 1, 0, 3, 2, 3]) (4) (by aesop)
#guard ¬(lengthOfLIS_postcond ([0, 1, 0, 3, 2, 3]) (3) (by aesop))
#guard ¬(lengthOfLIS_postcond ([0, 1, 0, 3, 2, 3]) (5) (by aesop))
#guard lengthOfLIS ([0, 1, 0, 3, 2, 3]) (by aesop) = (4)

-- Test case 3
#guard lengthOfLIS_precond ([7, 7, 7, 7, 7, 7, 7])
#guard lengthOfLIS_postcond ([7, 7, 7, 7, 7, 7, 7]) (1) (by aesop)
#guard ¬(lengthOfLIS_postcond ([7, 7, 7, 7, 7, 7, 7]) (0) (by aesop))
#guard ¬(lengthOfLIS_postcond ([7, 7, 7, 7, 7, 7, 7]) (7) (by aesop))
#guard lengthOfLIS ([7, 7, 7, 7, 7, 7, 7]) (by aesop) = (1)

-- Test case 4
#guard lengthOfLIS_precond ([])
#guard lengthOfLIS_postcond ([]) (0) (by aesop)
#guard ¬(lengthOfLIS_postcond ([]) (1) (by aesop))
#guard lengthOfLIS ([]) (by aesop) = (0)

-- Test case 5
#guard lengthOfLIS_precond ([4, 10, 4, 3, 8, 9])
#guard lengthOfLIS_postcond ([4, 10, 4, 3, 8, 9]) (3) (by aesop)
#guard ¬(lengthOfLIS_postcond ([4, 10, 4, 3, 8, 9]) (2) (by aesop))
#guard ¬(lengthOfLIS_postcond ([4, 10, 4, 3, 8, 9]) (4) (by aesop))
#guard ¬(lengthOfLIS_postcond ([4, 10, 4, 3, 8, 9]) (6) (by aesop))
#guard lengthOfLIS ([4, 10, 4, 3, 8, 9]) (by aesop) = (3)

-- Test case 6
#guard lengthOfLIS_precond ([1, 3, 6, 7, 9, 4, 10, 5, 6])
#guard lengthOfLIS_postcond ([1, 3, 6, 7, 9, 4, 10, 5, 6]) (6) (by aesop)
#guard ¬(lengthOfLIS_postcond ([1, 3, 6, 7, 9, 4, 10, 5, 6]) (5) (by aesop))
#guard ¬(lengthOfLIS_postcond ([1, 3, 6, 7, 9, 4, 10, 5, 6]) (7) (by aesop))
#guard ¬(lengthOfLIS_postcond ([1, 3, 6, 7, 9, 4, 10, 5, 6]) (9) (by aesop))
#guard lengthOfLIS ([1, 3, 6, 7, 9, 4, 10, 5, 6]) (by aesop) = (6)

-- Test case 7
#guard lengthOfLIS_precond ([10, 22, 9, 33, 21, 50, 41, 60, 80])
#guard lengthOfLIS_postcond ([10, 22, 9, 33, 21, 50, 41, 60, 80]) (6) (by aesop)
#guard ¬(lengthOfLIS_postcond ([10, 22, 9, 33, 21, 50, 41, 60, 80]) (5) (by aesop))
#guard ¬(lengthOfLIS_postcond ([10, 22, 9, 33, 21, 50, 41, 60, 80]) (7) (by aesop))
#guard ¬(lengthOfLIS_postcond ([10, 22, 9, 33, 21, 50, 41, 60, 80]) (9) (by aesop))
#guard lengthOfLIS ([10, 22, 9, 33, 21, 50, 41, 60, 80]) (by aesop) = (6)

-- Test case 8
#guard lengthOfLIS_precond ([0, 8, 4, 12, 2, 10, 6, 14, 1, 9, 5, 13, 3, 11, 7, 15])
#guard lengthOfLIS_postcond ([0, 8, 4, 12, 2, 10, 6, 14, 1, 9, 5, 13, 3, 11, 7, 15]) (6) (by aesop)
#guard ¬(lengthOfLIS_postcond ([0, 8, 4, 12, 2, 10, 6, 14, 1, 9, 5, 13, 3, 11, 7, 15]) (5) (by aesop))
#guard ¬(lengthOfLIS_postcond ([0, 8, 4, 12, 2, 10, 6, 14, 1, 9, 5, 13, 3, 11, 7, 15]) (7) (by aesop))
#guard ¬(lengthOfLIS_postcond ([0, 8, 4, 12, 2, 10, 6, 14, 1, 9, 5, 13, 3, 11, 7, 15]) (16) (by aesop))
#guard lengthOfLIS ([0, 8, 4, 12, 2, 10, 6, 14, 1, 9, 5, 13, 3, 11, 7, 15]) (by aesop) = (6)

-- Test case 9
#guard lengthOfLIS_precond ([-2, -1])
#guard lengthOfLIS_postcond ([-2, -1]) (2) (by aesop)
#guard ¬(lengthOfLIS_postcond ([-2, -1]) (1) (by aesop))
#guard ¬(lengthOfLIS_postcond ([-2, -1]) (0) (by aesop))
#guard lengthOfLIS ([-2, -1]) (by aesop) = (2)
