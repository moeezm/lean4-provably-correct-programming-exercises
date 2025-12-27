import Aesop

/-
-----Description-----
Implement a Lean 4 function that merges two ascendingly sorted lists of
integers into one single sorted list (ascending). The resulting list must
contain all elements from both input lists, preserving their ascending order.

-----Input-----
The input consists of two lists of integers:
arr1: A sorted list of integers (ascending)
arr2: Another sorted list of integers (ascending)

-----Output-----
The output is a list of integers:
Returns a new list containing all elements from arr1 and arr2, sorted in
ascending order.


-/

@[reducible, simp]
def mergeSortedLists_precond (arr1 : List Int) (arr2 : List Int) : Prop := sorry

def mergeSortedLists (arr1 : List Int) (arr2 : List Int) (h_precond : mergeSortedLists_precond arr1 arr2) : List Int := sorry

@[reducible, simp]
def mergeSortedLists_postcond (arr1 : List Int) (arr2 : List Int) (result : List Int) (h_precond : mergeSortedLists_precond arr1 arr2) : Prop := sorry

theorem mergeSortedLists_spec_satisfied (arr1 : List Int) (arr2 : List Int) (h_precond : mergeSortedLists_precond arr1 arr2) :
    mergeSortedLists_postcond arr1 arr2 (mergeSortedLists arr1 arr2 h_precond) h_precond := by
  sorry

-- Test Guards

-- Rejected inputs
#guard ¬(mergeSortedLists_precond ([3, 2, 1]) ([6, 5, 4]))

-- Test case 1
#guard mergeSortedLists_precond ([1, 3, 5]) ([2, 4, 6])
#guard mergeSortedLists_postcond ([1, 3, 5]) ([2, 4, 6]) ([1, 2, 3, 4, 5, 6]) (by aesop)
#guard ¬(mergeSortedLists_postcond ([1, 3, 5]) ([2, 4, 6]) ([1, 3, 5]) (by aesop))
#guard ¬(mergeSortedLists_postcond ([1, 3, 5]) ([2, 4, 6]) ([2, 4, 6]) (by aesop))
#guard ¬(mergeSortedLists_postcond ([1, 3, 5]) ([2, 4, 6]) ([1, 3, 2, 4, 5, 6]) (by aesop))
#guard mergeSortedLists ([1, 3, 5]) ([2, 4, 6]) (by aesop) = ([1, 2, 3, 4, 5, 6])

-- Test case 2
#guard mergeSortedLists_precond ([]) ([])
#guard mergeSortedLists_postcond ([]) ([]) ([]) (by aesop)
#guard ¬(mergeSortedLists_postcond ([]) ([]) ([0]) (by aesop))
#guard ¬(mergeSortedLists_postcond ([]) ([]) ([999]) (by aesop))
#guard mergeSortedLists ([]) ([]) (by aesop) = ([])

-- Test case 3
#guard mergeSortedLists_precond ([-2, 0, 1]) ([-3, -1])
#guard mergeSortedLists_postcond ([-2, 0, 1]) ([-3, -1]) ([-3, -2, -1, 0, 1]) (by aesop)
#guard ¬(mergeSortedLists_postcond ([-2, 0, 1]) ([-3, -1]) ([-3, -1]) (by aesop))
#guard ¬(mergeSortedLists_postcond ([-2, 0, 1]) ([-3, -1]) ([0, 1]) (by aesop))
#guard ¬(mergeSortedLists_postcond ([-2, 0, 1]) ([-3, -1]) ([-2, 0, 1]) (by aesop))
#guard mergeSortedLists ([-2, 0, 1]) ([-3, -1]) (by aesop) = ([-3, -2, -1, 0, 1])

-- Test case 4
#guard mergeSortedLists_precond ([10, 20, 30]) ([5, 25, 35])
#guard mergeSortedLists_postcond ([10, 20, 30]) ([5, 25, 35]) ([5, 10, 20, 25, 30, 35]) (by aesop)
#guard ¬(mergeSortedLists_postcond ([10, 20, 30]) ([5, 25, 35]) ([10, 20, 30]) (by aesop))
#guard ¬(mergeSortedLists_postcond ([10, 20, 30]) ([5, 25, 35]) ([5, 25, 35]) (by aesop))
#guard ¬(mergeSortedLists_postcond ([10, 20, 30]) ([5, 25, 35]) ([10, 20, 25, 30, 35]) (by aesop))
#guard mergeSortedLists ([10, 20, 30]) ([5, 25, 35]) (by aesop) = ([5, 10, 20, 25, 30, 35])

-- Test case 5
#guard mergeSortedLists_precond ([1, 2, 2]) ([2, 3, 3])
#guard mergeSortedLists_postcond ([1, 2, 2]) ([2, 3, 3]) ([1, 2, 2, 2, 3, 3]) (by aesop)
#guard ¬(mergeSortedLists_postcond ([1, 2, 2]) ([2, 3, 3]) ([1, 2, 3]) (by aesop))
#guard ¬(mergeSortedLists_postcond ([1, 2, 2]) ([2, 3, 3]) ([2, 2, 2, 3, 3]) (by aesop))
#guard mergeSortedLists ([1, 2, 2]) ([2, 3, 3]) (by aesop) = ([1, 2, 2, 2, 3, 3])
