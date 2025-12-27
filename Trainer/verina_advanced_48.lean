import Aesop

/-
-----Description----- 
This task requires implementing the merge sort algorithm in Lean 4 to sort a
list of integers in ascending order. Merge sort is a divide-and-conquer
algorithm that recursively splits the input list into two halves, sorts them
separately, and then merges the sorted halves to produce the final sorted
result.

The merge sort algorithm works as follows:
1. If the list has one element or is empty, it is already sorted.
2. Otherwise, divide the list into two roughly equal parts.
3. Recursively sort both halves.
4. Merge the two sorted halves to produce a single sorted list.

The key operation in merge sort is the merging step, which takes two sorted
lists and combines them into a single sorted list by repeatedly taking the
smaller of the two elements at the front of the lists.

-----Input-----
The input consists of one parameter:
list: A list of integers that needs to be sorted.

-----Output-----
The output is a list of integers:
Returns a new list containing all elements from the input list, sorted in
ascending order.


-/

@[reducible, simp]
def mergeSort_precond (list : List Int) : Prop := sorry

def mergeSort (list : List Int) (h_precond : mergeSort_precond list) : List Int := sorry

@[reducible, simp]
def mergeSort_postcond (list : List Int) (result : List Int) (h_precond : mergeSort_precond list) : Prop := sorry

theorem mergeSort_spec_satisfied (list : List Int) (h_precond : mergeSort_precond list) :
    mergeSort_postcond list (mergeSort list h_precond) h_precond := by
  sorry

-- Test Guards

-- Test case 1
#guard mergeSort_precond ([5, 2, 9, 1, 5, 6])
#guard mergeSort_postcond ([5, 2, 9, 1, 5, 6]) ([1, 2, 5, 5, 6, 9]) (by aesop)
#guard ¬(mergeSort_postcond ([5, 2, 9, 1, 5, 6]) ([5, 2, 9, 1, 5, 6]) (by aesop))
#guard ¬(mergeSort_postcond ([5, 2, 9, 1, 5, 6]) ([9, 6, 5, 5, 2, 1]) (by aesop))
#guard mergeSort ([5, 2, 9, 1, 5, 6]) (by aesop) = ([1, 2, 5, 5, 6, 9])

-- Test case 2
#guard mergeSort_precond ([3, 1, 4, 1, 5, 9, 2, 6])
#guard mergeSort_postcond ([3, 1, 4, 1, 5, 9, 2, 6]) ([1, 1, 2, 3, 4, 5, 6, 9]) (by aesop)
#guard ¬(mergeSort_postcond ([3, 1, 4, 1, 5, 9, 2, 6]) ([3, 1, 4, 1, 5, 9, 2, 6]) (by aesop))
#guard ¬(mergeSort_postcond ([3, 1, 4, 1, 5, 9, 2, 6]) ([9, 6, 5, 4, 3, 2, 1, 1]) (by aesop))
#guard mergeSort ([3, 1, 4, 1, 5, 9, 2, 6]) (by aesop) = ([1, 1, 2, 3, 4, 5, 6, 9])

-- Test case 3
#guard mergeSort_precond ([])
#guard mergeSort_postcond ([]) ([]) (by aesop)
#guard ¬(mergeSort_postcond ([]) ([1]) (by aesop))
#guard mergeSort ([]) (by aesop) = ([])

-- Test case 4
#guard mergeSort_precond ([1])
#guard mergeSort_postcond ([1]) ([1]) (by aesop)
#guard ¬(mergeSort_postcond ([1]) ([]) (by aesop))
#guard mergeSort ([1]) (by aesop) = ([1])

-- Test case 5
#guard mergeSort_precond ([5, 5, 5, 5])
#guard mergeSort_postcond ([5, 5, 5, 5]) ([5, 5, 5, 5]) (by aesop)
#guard ¬(mergeSort_postcond ([5, 5, 5, 5]) ([5, 5, 5]) (by aesop))
#guard ¬(mergeSort_postcond ([5, 5, 5, 5]) ([5, 5, 5, 5, 5]) (by aesop))
#guard mergeSort ([5, 5, 5, 5]) (by aesop) = ([5, 5, 5, 5])

-- Test case 6
#guard mergeSort_precond ([9, 8, 7, 6, 5, 4, 3, 2, 1])
#guard mergeSort_postcond ([9, 8, 7, 6, 5, 4, 3, 2, 1]) ([1, 2, 3, 4, 5, 6, 7, 8, 9]) (by aesop)
#guard ¬(mergeSort_postcond ([9, 8, 7, 6, 5, 4, 3, 2, 1]) ([9, 8, 7, 6, 5, 4, 3, 2, 1]) (by aesop))
#guard mergeSort ([9, 8, 7, 6, 5, 4, 3, 2, 1]) (by aesop) = ([1, 2, 3, 4, 5, 6, 7, 8, 9])

-- Test case 7
#guard mergeSort_precond ([1, 2, 3, 4, 5])
#guard mergeSort_postcond ([1, 2, 3, 4, 5]) ([1, 2, 3, 4, 5]) (by aesop)
#guard ¬(mergeSort_postcond ([1, 2, 3, 4, 5]) ([5, 4, 3, 2, 1]) (by aesop))
#guard mergeSort ([1, 2, 3, 4, 5]) (by aesop) = ([1, 2, 3, 4, 5])

-- Test case 8
#guard mergeSort_precond ([-3, -1, -5, -2])
#guard mergeSort_postcond ([-3, -1, -5, -2]) ([-5, -3, -2, -1]) (by aesop)
#guard ¬(mergeSort_postcond ([-3, -1, -5, -2]) ([-3, -1, -5, -2]) (by aesop))
#guard ¬(mergeSort_postcond ([-3, -1, -5, -2]) ([-1, -2, -3, -5]) (by aesop))
#guard mergeSort ([-3, -1, -5, -2]) (by aesop) = ([-5, -3, -2, -1])
