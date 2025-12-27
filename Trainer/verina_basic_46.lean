import Aesop

/-
-----Description----- 
This task requires writing a Lean 4 method that finds the last occurrence of a
specified element in a sorted array of integers. The method should return the
index corresponding to the last occurrence of the element if it is present; if
the element is absent, it should return -1. Additionally, the array must remain
unchanged after the method is executed.

-----Input-----
The input consists of:
arr: A sorted array of integers in non-decreasing order.
elem: An integer whose last occurrence position is to be determined.

-----Output-----
The output is an integer:
Returns the index of the last occurrence of the specified integer in the array
if it exists.
Returns -1 if the integer is not found in the array.

-----Note-----
The input array is assumed to be sorted in non-decreasing order and remains
unchanged by the method.
-/

@[reducible, simp]
def lastPosition_precond (arr : Array Int) (elem : Int) : Prop := sorry

def lastPosition (arr : Array Int) (elem : Int) (h_precond : lastPosition_precond arr elem) : Int := sorry

@[reducible, simp]
def lastPosition_postcond (arr : Array Int) (elem : Int) (result : Int) (h_precond : lastPosition_precond arr elem) : Prop := sorry

theorem lastPosition_spec_satisfied (arr : Array Int) (elem : Int) (h_precond : lastPosition_precond arr elem) :
    lastPosition_postcond arr elem (lastPosition arr elem h_precond) h_precond := by
  sorry

-- Test Guards

-- Rejected inputs
#guard ¬(lastPosition_precond (#[3, 2, 1]) (2))

-- Test case 1
#guard lastPosition_precond (#[1, 2, 2, 3, 4, 5]) (2)
#guard lastPosition_postcond (#[1, 2, 2, 3, 4, 5]) (2) (2) (by aesop)
#guard ¬(lastPosition_postcond (#[1, 2, 2, 3, 4, 5]) (2) (0) (by aesop))
#guard ¬(lastPosition_postcond (#[1, 2, 2, 3, 4, 5]) (2) (1) (by aesop))
#guard ¬(lastPosition_postcond (#[1, 2, 2, 3, 4, 5]) (2) (3) (by aesop))
#guard lastPosition (#[1, 2, 2, 3, 4, 5]) (2) (by aesop) = (2)

-- Test case 2
#guard lastPosition_precond (#[1, 2, 2, 3, 4, 5]) (6)
#guard lastPosition_postcond (#[1, 2, 2, 3, 4, 5]) (6) (-1) (by aesop)
#guard ¬(lastPosition_postcond (#[1, 2, 2, 3, 4, 5]) (6) (0) (by aesop))
#guard ¬(lastPosition_postcond (#[1, 2, 2, 3, 4, 5]) (6) (1) (by aesop))
#guard ¬(lastPosition_postcond (#[1, 2, 2, 3, 4, 5]) (6) (2) (by aesop))
#guard lastPosition (#[1, 2, 2, 3, 4, 5]) (6) (by aesop) = (-1)

-- Test case 3
#guard lastPosition_precond (#[1, 2, 2, 3, 4, 5]) (5)
#guard lastPosition_postcond (#[1, 2, 2, 3, 4, 5]) (5) (5) (by aesop)
#guard ¬(lastPosition_postcond (#[1, 2, 2, 3, 4, 5]) (5) (3) (by aesop))
#guard ¬(lastPosition_postcond (#[1, 2, 2, 3, 4, 5]) (5) (4) (by aesop))
#guard ¬(lastPosition_postcond (#[1, 2, 2, 3, 4, 5]) (5) (0) (by aesop))
#guard lastPosition (#[1, 2, 2, 3, 4, 5]) (5) (by aesop) = (5)

-- Test case 4
#guard lastPosition_precond (#[1]) (1)
#guard lastPosition_postcond (#[1]) (1) (0) (by aesop)
#guard ¬(lastPosition_postcond (#[1]) (1) (1) (by aesop))
#guard ¬(lastPosition_postcond (#[1]) (1) (-1) (by aesop))
#guard ¬(lastPosition_postcond (#[1]) (1) (2) (by aesop))
#guard lastPosition (#[1]) (1) (by aesop) = (0)

-- Test case 5
#guard lastPosition_precond (#[1, 1, 1, 1]) (1)
#guard lastPosition_postcond (#[1, 1, 1, 1]) (1) (3) (by aesop)
#guard ¬(lastPosition_postcond (#[1, 1, 1, 1]) (1) (0) (by aesop))
#guard ¬(lastPosition_postcond (#[1, 1, 1, 1]) (1) (1) (by aesop))
#guard ¬(lastPosition_postcond (#[1, 1, 1, 1]) (1) (2) (by aesop))
#guard lastPosition (#[1, 1, 1, 1]) (1) (by aesop) = (3)

-- Test case 6
#guard lastPosition_precond (#[2, 2, 3, 3, 3]) (3)
#guard lastPosition_postcond (#[2, 2, 3, 3, 3]) (3) (4) (by aesop)
#guard ¬(lastPosition_postcond (#[2, 2, 3, 3, 3]) (3) (2) (by aesop))
#guard ¬(lastPosition_postcond (#[2, 2, 3, 3, 3]) (3) (3) (by aesop))
#guard ¬(lastPosition_postcond (#[2, 2, 3, 3, 3]) (3) (5) (by aesop))
#guard lastPosition (#[2, 2, 3, 3, 3]) (3) (by aesop) = (4)
