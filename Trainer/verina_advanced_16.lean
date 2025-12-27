import Aesop

/-
-----Description-----
Implement the insertion sort algorithm in Lean 4. The function takes a single
list of integers
as input and returns a new list that contains the same integers in ascending
order.

Implementation must follow a standard insertion sort approach, placing each
element into its correct position.
The resulting list must be sorted in ascending order.
The returned list must be a permutation of the input list (i.e., contain
exactly the same elements).

-----Input-----
A single list of integers, denoted as xs.

-----Output-----
A list of integers, sorted in ascending order.

Example:
Input:  [3, 1, 4, 2]
Output: [1, 2, 3, 4]


-/

@[reducible, simp]
def insertionSort_precond (xs : List Int) : Prop := sorry

def insertionSort (xs : List Int) (h_precond : insertionSort_precond xs) : List Int := sorry

@[reducible, simp]
def insertionSort_postcond (xs : List Int) (result : List Int) (h_precond : insertionSort_precond xs) : Prop := sorry

theorem insertionSort_spec_satisfied (xs : List Int) (h_precond : insertionSort_precond xs) :
    insertionSort_postcond xs (insertionSort xs h_precond) h_precond := by
  sorry

-- Test Guards

-- Test case 1
#guard insertionSort_precond ([])
#guard insertionSort_postcond ([]) ([]) (by aesop)
#guard ¬(insertionSort_postcond ([]) ([0]) (by aesop))
#guard ¬(insertionSort_postcond ([]) ([1, 2, 3]) (by aesop))
#guard insertionSort ([]) (by aesop) = ([])

-- Test case 2
#guard insertionSort_precond ([42])
#guard insertionSort_postcond ([42]) ([42]) (by aesop)
#guard ¬(insertionSort_postcond ([42]) ([24]) (by aesop))
#guard ¬(insertionSort_postcond ([42]) ([]) (by aesop))
#guard ¬(insertionSort_postcond ([42]) ([42, 42]) (by aesop))
#guard insertionSort ([42]) (by aesop) = ([42])

-- Test case 3
#guard insertionSort_precond ([3, 1, 4, 2])
#guard insertionSort_postcond ([3, 1, 4, 2]) ([1, 2, 3, 4]) (by aesop)
#guard ¬(insertionSort_postcond ([3, 1, 4, 2]) ([1, 3, 2, 4]) (by aesop))
#guard ¬(insertionSort_postcond ([3, 1, 4, 2]) ([4, 3, 2, 1]) (by aesop))
#guard insertionSort ([3, 1, 4, 2]) (by aesop) = ([1, 2, 3, 4])

-- Test case 4
#guard insertionSort_precond ([5, -1, 0, 10, -1])
#guard insertionSort_postcond ([5, -1, 0, 10, -1]) ([-1, -1, 0, 5, 10]) (by aesop)
#guard ¬(insertionSort_postcond ([5, -1, 0, 10, -1]) ([-1, -1, 0, 10, 5]) (by aesop))
#guard ¬(insertionSort_postcond ([5, -1, 0, 10, -1]) ([10, 5, 0, -1, -1]) (by aesop))
#guard insertionSort ([5, -1, 0, 10, -1]) (by aesop) = ([-1, -1, 0, 5, 10])

-- Test case 5
#guard insertionSort_precond ([2, 2, 2, 2, 2])
#guard insertionSort_postcond ([2, 2, 2, 2, 2]) ([2, 2, 2, 2, 2]) (by aesop)
#guard ¬(insertionSort_postcond ([2, 2, 2, 2, 2]) ([2, 2, 2, 2]) (by aesop))
#guard ¬(insertionSort_postcond ([2, 2, 2, 2, 2]) ([]) (by aesop))
#guard insertionSort ([2, 2, 2, 2, 2]) (by aesop) = ([2, 2, 2, 2, 2])
