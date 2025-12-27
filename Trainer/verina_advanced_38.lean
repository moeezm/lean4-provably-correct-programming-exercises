import Aesop

/-
-----Description-----
This task requires implementing a Lean 4 method that, given a list of
intervals, returns the maximum amount that can be spanned after we removed one
of the intervals
You may assume you'll receive at least one interval

-----Input-----
The input consists of a list of ordered pairs of intervals.
-----Output-----
The output is an integer:
Return the largest span that is possible after removing one of the intervals.


-/

@[reducible, simp]
def maxCoverageAfterRemovingOne_precond (intervals : List (Prod Nat Nat)) : Prop := sorry

def maxCoverageAfterRemovingOne (intervals : List (Prod Nat Nat)) (h_precond : maxCoverageAfterRemovingOne_precond intervals) : Nat := sorry

@[reducible, simp]
def maxCoverageAfterRemovingOne_postcond (intervals : List (Prod Nat Nat)) (result : Nat) (h_precond : maxCoverageAfterRemovingOne_precond intervals) : Prop := sorry

theorem maxCoverageAfterRemovingOne_spec_satisfied (intervals : List (Prod Nat Nat)) (h_precond : maxCoverageAfterRemovingOne_precond intervals) :
    maxCoverageAfterRemovingOne_postcond intervals (maxCoverageAfterRemovingOne intervals h_precond) h_precond := by
  sorry

-- Test Guards

-- Rejected inputs
#guard ¬(maxCoverageAfterRemovingOne_precond ([]))

-- Test case 1
#guard maxCoverageAfterRemovingOne_precond ([(1, 3), (2, 5), (6, 8)])
#guard maxCoverageAfterRemovingOne_postcond ([(1, 3), (2, 5), (6, 8)]) (5) (by aesop)
#guard ¬(maxCoverageAfterRemovingOne_postcond ([(1, 3), (2, 5), (6, 8)]) (4) (by aesop))
#guard ¬(maxCoverageAfterRemovingOne_postcond ([(1, 3), (2, 5), (6, 8)]) (6) (by aesop))
#guard maxCoverageAfterRemovingOne ([(1, 3), (2, 5), (6, 8)]) (by aesop) = (5)

-- Test case 2
#guard maxCoverageAfterRemovingOne_precond ([(1, 4), (2, 6), (8, 10), (9, 12)])
#guard maxCoverageAfterRemovingOne_postcond ([(1, 4), (2, 6), (8, 10), (9, 12)]) (8) (by aesop)
#guard ¬(maxCoverageAfterRemovingOne_postcond ([(1, 4), (2, 6), (8, 10), (9, 12)]) (7) (by aesop))
#guard ¬(maxCoverageAfterRemovingOne_postcond ([(1, 4), (2, 6), (8, 10), (9, 12)]) (6) (by aesop))
#guard maxCoverageAfterRemovingOne ([(1, 4), (2, 6), (8, 10), (9, 12)]) (by aesop) = (8)

-- Test case 3
#guard maxCoverageAfterRemovingOne_precond ([(1, 2), (2, 3), (3, 4)])
#guard maxCoverageAfterRemovingOne_postcond ([(1, 2), (2, 3), (3, 4)]) (2) (by aesop)
#guard ¬(maxCoverageAfterRemovingOne_postcond ([(1, 2), (2, 3), (3, 4)]) (3) (by aesop))
#guard maxCoverageAfterRemovingOne ([(1, 2), (2, 3), (3, 4)]) (by aesop) = (2)

-- Test case 4
#guard maxCoverageAfterRemovingOne_precond ([(1, 10), (2, 3), (4, 5)])
#guard maxCoverageAfterRemovingOne_postcond ([(1, 10), (2, 3), (4, 5)]) (9) (by aesop)
#guard ¬(maxCoverageAfterRemovingOne_postcond ([(1, 10), (2, 3), (4, 5)]) (7) (by aesop))
#guard ¬(maxCoverageAfterRemovingOne_postcond ([(1, 10), (2, 3), (4, 5)]) (10) (by aesop))
#guard maxCoverageAfterRemovingOne ([(1, 10), (2, 3), (4, 5)]) (by aesop) = (9)

-- Test case 5
#guard maxCoverageAfterRemovingOne_precond ([(5, 6), (1, 2), (3, 4)])
#guard maxCoverageAfterRemovingOne_postcond ([(5, 6), (1, 2), (3, 4)]) (2) (by aesop)
#guard ¬(maxCoverageAfterRemovingOne_postcond ([(5, 6), (1, 2), (3, 4)]) (5) (by aesop))
#guard ¬(maxCoverageAfterRemovingOne_postcond ([(5, 6), (1, 2), (3, 4)]) (3) (by aesop))
#guard maxCoverageAfterRemovingOne ([(5, 6), (1, 2), (3, 4)]) (by aesop) = (2)
