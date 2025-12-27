import Aesop

/-
-----Description-----
This task involves merging two sorted arrays of natural numbers (it is ill
defined if inputs aren't sorted.)
-----Input-----
The input consists of two arrays:
a1: A sorted array of natural numbers
a2: A sorted array of natural numbers
-----Output-----
The output is an array:
Returns a new array with all elements from both input arrays (included once and
only once)
The resulting array is sorted itself


-/

@[reducible, simp]
def mergeSorted_precond (a1 : Array Nat) (a2 : Array Nat) : Prop := sorry

def mergeSorted (a1 : Array Nat) (a2 : Array Nat) (h_precond : mergeSorted_precond a1 a2) : Array Nat := sorry

@[reducible, simp]
def mergeSorted_postcond (a1 : Array Nat) (a2 : Array Nat) (result : Array Nat) (h_precond : mergeSorted_precond a1 a2) : Prop := sorry

theorem mergeSorted_spec_satisfied (a1 : Array Nat) (a2 : Array Nat) (h_precond : mergeSorted_precond a1 a2) :
    mergeSorted_postcond a1 a2 (mergeSorted a1 a2 h_precond) h_precond := by
  sorry

-- Test Guards

-- Rejected inputs
#guard ¬(mergeSorted_precond (#[3, 2, 1]) (#[6, 5, 4]))

-- Test case 1
#guard mergeSorted_precond (#[1, 3, 5]) (#[2, 4, 6])
#guard mergeSorted_postcond (#[1, 3, 5]) (#[2, 4, 6]) (#[1, 2, 3, 4, 5, 6]) (by aesop)
#guard ¬(mergeSorted_postcond (#[1, 3, 5]) (#[2, 4, 6]) (#[1, 3, 5, 2, 4, 6]) (by aesop))
#guard ¬(mergeSorted_postcond (#[1, 3, 5]) (#[2, 4, 6]) (#[2, 1, 3, 4, 5, 6]) (by aesop))
#guard mergeSorted (#[1, 3, 5]) (#[2, 4, 6]) (by aesop) = (#[1, 2, 3, 4, 5, 6])

-- Test case 2
#guard mergeSorted_precond (#[]) (#[1, 2, 3])
#guard mergeSorted_postcond (#[]) (#[1, 2, 3]) (#[1, 2, 3]) (by aesop)
#guard ¬(mergeSorted_postcond (#[]) (#[1, 2, 3]) (#[]) (by aesop))
#guard ¬(mergeSorted_postcond (#[]) (#[1, 2, 3]) (#[3, 2, 1]) (by aesop))
#guard mergeSorted (#[]) (#[1, 2, 3]) (by aesop) = (#[1, 2, 3])

-- Test case 3
#guard mergeSorted_precond (#[1, 2, 3]) (#[])
#guard mergeSorted_postcond (#[1, 2, 3]) (#[]) (#[1, 2, 3]) (by aesop)
#guard ¬(mergeSorted_postcond (#[1, 2, 3]) (#[]) (#[]) (by aesop))
#guard ¬(mergeSorted_postcond (#[1, 2, 3]) (#[]) (#[3, 2, 1]) (by aesop))
#guard mergeSorted (#[1, 2, 3]) (#[]) (by aesop) = (#[1, 2, 3])

-- Test case 4
#guard mergeSorted_precond (#[]) (#[])
#guard mergeSorted_postcond (#[]) (#[]) (#[]) (by aesop)
#guard ¬(mergeSorted_postcond (#[]) (#[]) (#[1]) (by aesop))
#guard mergeSorted (#[]) (#[]) (by aesop) = (#[])

-- Test case 5
#guard mergeSorted_precond (#[1, 1, 2]) (#[1, 2, 2])
#guard mergeSorted_postcond (#[1, 1, 2]) (#[1, 2, 2]) (#[1, 1, 1, 2, 2, 2]) (by aesop)
#guard ¬(mergeSorted_postcond (#[1, 1, 2]) (#[1, 2, 2]) (#[1, 1, 2, 1, 2, 2]) (by aesop))
#guard ¬(mergeSorted_postcond (#[1, 1, 2]) (#[1, 2, 2]) (#[1, 2]) (by aesop))
#guard mergeSorted (#[1, 1, 2]) (#[1, 2, 2]) (by aesop) = (#[1, 1, 1, 2, 2, 2])

-- Test case 6
#guard mergeSorted_precond (#[10, 20, 30]) (#[5, 15, 25])
#guard mergeSorted_postcond (#[10, 20, 30]) (#[5, 15, 25]) (#[5, 10, 15, 20, 25, 30]) (by aesop)
#guard ¬(mergeSorted_postcond (#[10, 20, 30]) (#[5, 15, 25]) (#[10, 20, 30, 5, 15, 25]) (by aesop))
#guard mergeSorted (#[10, 20, 30]) (#[5, 15, 25]) (by aesop) = (#[5, 10, 15, 20, 25, 30])

-- Test case 7
#guard mergeSorted_precond (#[1, 3, 5, 7, 9]) (#[2, 4, 6, 8, 10])
#guard mergeSorted_postcond (#[1, 3, 5, 7, 9]) (#[2, 4, 6, 8, 10]) (#[1, 2, 3, 4, 5, 6, 7, 8, 9, 10]) (by aesop)
#guard ¬(mergeSorted_postcond (#[1, 3, 5, 7, 9]) (#[2, 4, 6, 8, 10]) (#[1, 3, 5, 7, 9, 2, 4, 6, 8, 10]) (by aesop))
#guard mergeSorted (#[1, 3, 5, 7, 9]) (#[2, 4, 6, 8, 10]) (by aesop) = (#[1, 2, 3, 4, 5, 6, 7, 8, 9, 10])

-- Test case 8
#guard mergeSorted_precond (#[5, 5, 5]) (#[5, 5, 5])
#guard mergeSorted_postcond (#[5, 5, 5]) (#[5, 5, 5]) (#[5, 5, 5, 5, 5, 5]) (by aesop)
#guard ¬(mergeSorted_postcond (#[5, 5, 5]) (#[5, 5, 5]) (#[5, 5, 5]) (by aesop))
#guard mergeSorted (#[5, 5, 5]) (#[5, 5, 5]) (by aesop) = (#[5, 5, 5, 5, 5, 5])
