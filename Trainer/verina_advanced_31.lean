import Aesop

/-
-----Description-----
This task requires writing a Lean 4 function that finds the length of the
longest strictly increasing subsequence in a list of integers. A subsequence is
any sequence that can be derived from the list by deleting zero or more elements
without changing the order of the remaining elements. The function must return
the length of the longest possible such sequence.

-----Input-----
The input consists of a single value:
xs: A list of integers of type `List Int`.

-----Output-----
The output is a natural number:
Returns the length of the longest strictly increasing subsequence found in the
list.


-/

@[reducible, simp]
def longestIncreasingSubseqLength_precond (xs : List Int) : Prop := sorry

def longestIncreasingSubseqLength (xs : List Int) (h_precond : longestIncreasingSubseqLength_precond xs) : Nat := sorry

@[reducible, simp]
def longestIncreasingSubseqLength_postcond (xs : List Int) (result : Nat) (h_precond : longestIncreasingSubseqLength_precond xs) : Prop := sorry

theorem longestIncreasingSubseqLength_spec_satisfied (xs : List Int) (h_precond : longestIncreasingSubseqLength_precond xs) :
    longestIncreasingSubseqLength_postcond xs (longestIncreasingSubseqLength xs h_precond) h_precond := by
  sorry

-- Test Guards

-- Test case 1
#guard longestIncreasingSubseqLength_precond ([1, 2, 3, 4])
#guard longestIncreasingSubseqLength_postcond ([1, 2, 3, 4]) (4) (by aesop)
#guard ¬(longestIncreasingSubseqLength_postcond ([1, 2, 3, 4]) (3) (by aesop))
#guard ¬(longestIncreasingSubseqLength_postcond ([1, 2, 3, 4]) (2) (by aesop))
#guard ¬(longestIncreasingSubseqLength_postcond ([1, 2, 3, 4]) (1) (by aesop))
#guard longestIncreasingSubseqLength ([1, 2, 3, 4]) (by aesop) = (4)

-- Test case 2
#guard longestIncreasingSubseqLength_precond ([4, 3, 2, 1])
#guard longestIncreasingSubseqLength_postcond ([4, 3, 2, 1]) (1) (by aesop)
#guard ¬(longestIncreasingSubseqLength_postcond ([4, 3, 2, 1]) (2) (by aesop))
#guard ¬(longestIncreasingSubseqLength_postcond ([4, 3, 2, 1]) (3) (by aesop))
#guard ¬(longestIncreasingSubseqLength_postcond ([4, 3, 2, 1]) (4) (by aesop))
#guard longestIncreasingSubseqLength ([4, 3, 2, 1]) (by aesop) = (1)

-- Test case 3
#guard longestIncreasingSubseqLength_precond ([1, 3, 2, 4, 0, 5])
#guard longestIncreasingSubseqLength_postcond ([1, 3, 2, 4, 0, 5]) (4) (by aesop)
#guard ¬(longestIncreasingSubseqLength_postcond ([1, 3, 2, 4, 0, 5]) (3) (by aesop))
#guard ¬(longestIncreasingSubseqLength_postcond ([1, 3, 2, 4, 0, 5]) (5) (by aesop))
#guard longestIncreasingSubseqLength ([1, 3, 2, 4, 0, 5]) (by aesop) = (4)

-- Test case 4
#guard longestIncreasingSubseqLength_precond ([])
#guard longestIncreasingSubseqLength_postcond ([]) (0) (by aesop)
#guard ¬(longestIncreasingSubseqLength_postcond ([]) (1) (by aesop))
#guard longestIncreasingSubseqLength ([]) (by aesop) = (0)

-- Test case 5
#guard longestIncreasingSubseqLength_precond ([5, 1, 6, 2, 7])
#guard longestIncreasingSubseqLength_postcond ([5, 1, 6, 2, 7]) (3) (by aesop)
#guard ¬(longestIncreasingSubseqLength_postcond ([5, 1, 6, 2, 7]) (2) (by aesop))
#guard ¬(longestIncreasingSubseqLength_postcond ([5, 1, 6, 2, 7]) (4) (by aesop))
#guard longestIncreasingSubseqLength ([5, 1, 6, 2, 7]) (by aesop) = (3)
