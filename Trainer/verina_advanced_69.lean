import Aesop

/-
-----Description-----
Given a sorted list of distinct integers and a target value, return the index
if the target is found. If it is not found, return the index where it would be
inserted to maintain the sorted order.

This function must preserve the sorted property of the list. The list is
assumed to be strictly increasing and contain no duplicates.

-----Input-----
xs : List Int — a sorted list of distinct integers in increasing order
target : Int — the integer to search for

-----Output-----
A natural number (Nat) representing the index at which the target is found, or
the index at which it should be inserted to maintain sorted order.


-/

@[reducible, simp]
def searchInsert_precond (xs : List Int) (target : Int) : Prop := sorry

def searchInsert (xs : List Int) (target : Int) (h_precond : searchInsert_precond xs target) : Nat := sorry

@[reducible, simp]
def searchInsert_postcond (xs : List Int) (target : Int) (result : Nat) (h_precond : searchInsert_precond xs target) : Prop := sorry

theorem searchInsert_spec_satisfied (xs : List Int) (target : Int) (h_precond : searchInsert_precond xs target) :
    searchInsert_postcond xs target (searchInsert xs target h_precond) h_precond := by
  sorry

-- Test Guards

-- Rejected inputs
#guard ¬(searchInsert_precond ([2, 1]) (5))
#guard ¬(searchInsert_precond ([1, 1]) (2))

-- Test case 1
#guard searchInsert_precond ([1, 3, 5, 6]) (5)
#guard searchInsert_postcond ([1, 3, 5, 6]) (5) (2) (by aesop)
#guard ¬(searchInsert_postcond ([1, 3, 5, 6]) (5) (0) (by aesop))
#guard ¬(searchInsert_postcond ([1, 3, 5, 6]) (5) (1) (by aesop))
#guard ¬(searchInsert_postcond ([1, 3, 5, 6]) (5) (3) (by aesop))
#guard ¬(searchInsert_postcond ([1, 3, 5, 6]) (5) (4) (by aesop))
#guard searchInsert ([1, 3, 5, 6]) (5) (by aesop) = (2)

-- Test case 2
#guard searchInsert_precond ([1, 3, 5, 6]) (2)
#guard searchInsert_postcond ([1, 3, 5, 6]) (2) (1) (by aesop)
#guard ¬(searchInsert_postcond ([1, 3, 5, 6]) (2) (0) (by aesop))
#guard ¬(searchInsert_postcond ([1, 3, 5, 6]) (2) (2) (by aesop))
#guard ¬(searchInsert_postcond ([1, 3, 5, 6]) (2) (3) (by aesop))
#guard searchInsert ([1, 3, 5, 6]) (2) (by aesop) = (1)

-- Test case 3
#guard searchInsert_precond ([1, 3, 5, 6]) (7)
#guard searchInsert_postcond ([1, 3, 5, 6]) (7) (4) (by aesop)
#guard ¬(searchInsert_postcond ([1, 3, 5, 6]) (7) (2) (by aesop))
#guard ¬(searchInsert_postcond ([1, 3, 5, 6]) (7) (3) (by aesop))
#guard searchInsert ([1, 3, 5, 6]) (7) (by aesop) = (4)

-- Test case 4
#guard searchInsert_precond ([1, 3, 5, 6]) (0)
#guard searchInsert_postcond ([1, 3, 5, 6]) (0) (0) (by aesop)
#guard ¬(searchInsert_postcond ([1, 3, 5, 6]) (0) (1) (by aesop))
#guard ¬(searchInsert_postcond ([1, 3, 5, 6]) (0) (2) (by aesop))
#guard searchInsert ([1, 3, 5, 6]) (0) (by aesop) = (0)

-- Test case 5
#guard searchInsert_precond ([]) (3)
#guard searchInsert_postcond ([]) (3) (0) (by aesop)
#guard ¬(searchInsert_postcond ([]) (3) (1) (by aesop))
#guard searchInsert ([]) (3) (by aesop) = (0)

-- Test case 6
#guard searchInsert_precond ([10]) (5)
#guard searchInsert_postcond ([10]) (5) (0) (by aesop)
#guard ¬(searchInsert_postcond ([10]) (5) (1) (by aesop))
#guard searchInsert ([10]) (5) (by aesop) = (0)

-- Test case 7
#guard searchInsert_precond ([10]) (15)
#guard searchInsert_postcond ([10]) (15) (1) (by aesop)
#guard ¬(searchInsert_postcond ([10]) (15) (0) (by aesop))
#guard searchInsert ([10]) (15) (by aesop) = (1)
