import Aesop

/-
-----Description----- 
This task requires implementing the insertion sort algorithm to sort a list of
integers in ascending order. The function should take a list of integers as
input and return a new list containing the same elements sorted in
non-decreasing order.

-----Input----- 
The input is:

l: A list of integers to be sorted.

-----Output----- 
The output is:

A list of integers that is sorted in non-decreasing order and is a permutation
of the input list.


-/

@[reducible, simp]
def insertionSort_precond (l : List Int) : Prop := sorry

def insertionSort (l : List Int) (h_precond : insertionSort_precond l) : List Int := sorry

@[reducible, simp]
def insertionSort_postcond (l : List Int) (result : List Int) (h_precond : insertionSort_precond l) : Prop := sorry

theorem insertionSort_spec_satisfied (l : List Int) (h_precond : insertionSort_precond l) :
    insertionSort_postcond l (insertionSort l h_precond) h_precond := by
  sorry

-- Test Guards

-- Test case 1
#guard insertionSort_precond ([])
#guard insertionSort_postcond ([]) ([]) (by aesop)
#guard ¬(insertionSort_postcond ([]) ([0]) (by aesop))
#guard ¬(insertionSort_postcond ([]) ([1]) (by aesop))
#guard insertionSort ([]) (by aesop) = ([])

-- Test case 2
#guard insertionSort_precond ([5])
#guard insertionSort_postcond ([5]) ([5]) (by aesop)
#guard ¬(insertionSort_postcond ([5]) ([]) (by aesop))
#guard ¬(insertionSort_postcond ([5]) ([5, 5]) (by aesop))
#guard insertionSort ([5]) (by aesop) = ([5])

-- Test case 3
#guard insertionSort_precond ([1, 2, 3])
#guard insertionSort_postcond ([1, 2, 3]) ([1, 2, 3]) (by aesop)
#guard ¬(insertionSort_postcond ([1, 2, 3]) ([3, 2, 1]) (by aesop))
#guard ¬(insertionSort_postcond ([1, 2, 3]) ([2, 1, 3]) (by aesop))
#guard insertionSort ([1, 2, 3]) (by aesop) = ([1, 2, 3])

-- Test case 4
#guard insertionSort_precond ([3, 2, 1])
#guard insertionSort_postcond ([3, 2, 1]) ([1, 2, 3]) (by aesop)
#guard ¬(insertionSort_postcond ([3, 2, 1]) ([3, 2, 1]) (by aesop))
#guard ¬(insertionSort_postcond ([3, 2, 1]) ([2, 1, 3]) (by aesop))
#guard insertionSort ([3, 2, 1]) (by aesop) = ([1, 2, 3])

-- Test case 5
#guard insertionSort_precond ([4, 2, 2, 3])
#guard insertionSort_postcond ([4, 2, 2, 3]) ([2, 2, 3, 4]) (by aesop)
#guard ¬(insertionSort_postcond ([4, 2, 2, 3]) ([4, 3, 2, 2]) (by aesop))
#guard ¬(insertionSort_postcond ([4, 2, 2, 3]) ([2, 3, 2, 4]) (by aesop))
#guard insertionSort ([4, 2, 2, 3]) (by aesop) = ([2, 2, 3, 4])
