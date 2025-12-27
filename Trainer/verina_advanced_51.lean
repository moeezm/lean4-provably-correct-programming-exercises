import Aesop

/-
-----Description-----
This task requires writing a Lean 4 method that takes two sorted
(non-decreasing) integer lists and merges them into a single sorted list. The
output must preserve order and include all elements from both input lists.

-----Input-----
The input consists of:
a: A list of integers sorted in non-decreasing order.
b: Another list of integers sorted in non-decreasing order.

-----Output-----
The output is a list of integers:
Returns a merged list that contains all elements from both input lists, sorted
in non-decreasing order.


-/

@[reducible, simp]
def mergeSorted_precond (a : List Int) (b : List Int) : Prop := sorry

def mergeSorted (a : List Int) (b : List Int) (h_precond : mergeSorted_precond a b) : List Int := sorry

@[reducible, simp]
def mergeSorted_postcond (a : List Int) (b : List Int) (result : List Int) (h_precond : mergeSorted_precond a b) : Prop := sorry

theorem mergeSorted_spec_satisfied (a : List Int) (b : List Int) (h_precond : mergeSorted_precond a b) :
    mergeSorted_postcond a b (mergeSorted a b h_precond) h_precond := by
  sorry

-- Test Guards

-- Rejected inputs
#guard ¬(mergeSorted_precond ([1, 2, 3]) ([6, 5, 4]))
#guard ¬(mergeSorted_precond ([3, 2, 1]) ([6, 5, 4]))

-- Test case 1
#guard mergeSorted_precond ([1, 3, 5]) ([2, 4, 6])
#guard mergeSorted_postcond ([1, 3, 5]) ([2, 4, 6]) ([1, 2, 3, 4, 5, 6]) (by aesop)
#guard ¬(mergeSorted_postcond ([1, 3, 5]) ([2, 4, 6]) ([1, 3, 5]) (by aesop))
#guard ¬(mergeSorted_postcond ([1, 3, 5]) ([2, 4, 6]) ([2, 4, 6]) (by aesop))
#guard ¬(mergeSorted_postcond ([1, 3, 5]) ([2, 4, 6]) ([6, 5, 4]) (by aesop))
#guard mergeSorted ([1, 3, 5]) ([2, 4, 6]) (by aesop) = ([1, 2, 3, 4, 5, 6])

-- Test case 2
#guard mergeSorted_precond ([1, 2]) ([1, 2, 3])
#guard mergeSorted_postcond ([1, 2]) ([1, 2, 3]) ([1, 1, 2, 2, 3]) (by aesop)
#guard ¬(mergeSorted_postcond ([1, 2]) ([1, 2, 3]) ([1, 2, 3]) (by aesop))
#guard mergeSorted ([1, 2]) ([1, 2, 3]) (by aesop) = ([1, 1, 2, 2, 3])

-- Test case 3
#guard mergeSorted_precond ([]) ([4, 5])
#guard mergeSorted_postcond ([]) ([4, 5]) ([4, 5]) (by aesop)
#guard ¬(mergeSorted_postcond ([]) ([4, 5]) ([]) (by aesop))
#guard mergeSorted ([]) ([4, 5]) (by aesop) = ([4, 5])

-- Test case 4
#guard mergeSorted_precond ([0, 3, 4]) ([])
#guard mergeSorted_postcond ([0, 3, 4]) ([]) ([0, 3, 4]) (by aesop)
#guard ¬(mergeSorted_postcond ([0, 3, 4]) ([]) ([4, 3, 0]) (by aesop))
#guard mergeSorted ([0, 3, 4]) ([]) (by aesop) = ([0, 3, 4])

-- Test case 5
#guard mergeSorted_precond ([1, 4, 6]) ([2, 3, 5])
#guard mergeSorted_postcond ([1, 4, 6]) ([2, 3, 5]) ([1, 2, 3, 4, 5, 6]) (by aesop)
#guard ¬(mergeSorted_postcond ([1, 4, 6]) ([2, 3, 5]) ([1, 4, 6, 2, 3, 5]) (by aesop))
#guard mergeSorted ([1, 4, 6]) ([2, 3, 5]) (by aesop) = ([1, 2, 3, 4, 5, 6])
