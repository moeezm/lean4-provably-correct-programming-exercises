import Aesop

/-
-----Description----- 
This task requires writing a Lean 4 method that finds the first missing natural
number in an increasingly sorted list. The method should return the smallest
natural number that is not in the list, ensuring that all natural numbers that
are smaller is inside the list.

-----Input-----
The input consists of a list of natural numbers sorted in increasing order:
l: The sorted list

-----Output-----
The output is a natural number:
Returns the smallest natural number that is not in the list, which means all
natural numbers that are smaller than the returned value should be inside the
input list.


-/

@[reducible, simp]
def smallestMissing_precond (l : List Nat) : Prop := sorry

def smallestMissing (l : List Nat) (h_precond : smallestMissing_precond l) : Nat := sorry

@[reducible, simp]
def smallestMissing_postcond (l : List Nat) (result : Nat) (h_precond : smallestMissing_precond l) : Prop := sorry

theorem smallestMissing_spec_satisfied (l : List Nat) (h_precond : smallestMissing_precond l) :
    smallestMissing_postcond l (smallestMissing l h_precond) h_precond := by
  sorry

-- Test Guards

-- Rejected inputs
#guard ¬(smallestMissing_precond ([1, 1]))
#guard ¬(smallestMissing_precond ([1, 0]))

-- Test case 1
#guard smallestMissing_precond ([0, 1, 2, 4, 5])
#guard smallestMissing_postcond ([0, 1, 2, 4, 5]) (3) (by aesop)
#guard ¬(smallestMissing_postcond ([0, 1, 2, 4, 5]) (1) (by aesop))
#guard ¬(smallestMissing_postcond ([0, 1, 2, 4, 5]) (2) (by aesop))
#guard ¬(smallestMissing_postcond ([0, 1, 2, 4, 5]) (0) (by aesop))
#guard smallestMissing ([0, 1, 2, 4, 5]) (by aesop) = (3)

-- Test case 2
#guard smallestMissing_precond ([])
#guard smallestMissing_postcond ([]) (0) (by aesop)
#guard ¬(smallestMissing_postcond ([]) (1) (by aesop))
#guard ¬(smallestMissing_postcond ([]) (2) (by aesop))
#guard ¬(smallestMissing_postcond ([]) (3) (by aesop))
#guard smallestMissing ([]) (by aesop) = (0)

-- Test case 3
#guard smallestMissing_precond ([1, 2, 3, 4])
#guard smallestMissing_postcond ([1, 2, 3, 4]) (0) (by aesop)
#guard ¬(smallestMissing_postcond ([1, 2, 3, 4]) (1) (by aesop))
#guard ¬(smallestMissing_postcond ([1, 2, 3, 4]) (2) (by aesop))
#guard ¬(smallestMissing_postcond ([1, 2, 3, 4]) (3) (by aesop))
#guard ¬(smallestMissing_postcond ([1, 2, 3, 4]) (4) (by aesop))
#guard smallestMissing ([1, 2, 3, 4]) (by aesop) = (0)

-- Test case 4
#guard smallestMissing_precond ([0, 1, 2, 3, 4])
#guard smallestMissing_postcond ([0, 1, 2, 3, 4]) (5) (by aesop)
#guard ¬(smallestMissing_postcond ([0, 1, 2, 3, 4]) (0) (by aesop))
#guard ¬(smallestMissing_postcond ([0, 1, 2, 3, 4]) (1) (by aesop))
#guard ¬(smallestMissing_postcond ([0, 1, 2, 3, 4]) (2) (by aesop))
#guard ¬(smallestMissing_postcond ([0, 1, 2, 3, 4]) (3) (by aesop))
#guard ¬(smallestMissing_postcond ([0, 1, 2, 3, 4]) (4) (by aesop))
#guard smallestMissing ([0, 1, 2, 3, 4]) (by aesop) = (5)

-- Test case 5
#guard smallestMissing_precond ([2, 3, 4, 5, 6])
#guard smallestMissing_postcond ([2, 3, 4, 5, 6]) (0) (by aesop)
#guard ¬(smallestMissing_postcond ([2, 3, 4, 5, 6]) (1) (by aesop))
#guard ¬(smallestMissing_postcond ([2, 3, 4, 5, 6]) (2) (by aesop))
#guard ¬(smallestMissing_postcond ([2, 3, 4, 5, 6]) (3) (by aesop))
#guard ¬(smallestMissing_postcond ([2, 3, 4, 5, 6]) (4) (by aesop))
#guard ¬(smallestMissing_postcond ([2, 3, 4, 5, 6]) (5) (by aesop))
#guard ¬(smallestMissing_postcond ([2, 3, 4, 5, 6]) (6) (by aesop))
#guard smallestMissing ([2, 3, 4, 5, 6]) (by aesop) = (0)
