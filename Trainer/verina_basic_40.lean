import Aesop

/-
-----Description----- 
This task requires writing a Lean 4 method that finds the second-smallest
number in an array of integers. The method should determine and return the
number that is larger than the smallest element in the array. It is crucial that
the input array remains unchanged after the computation.

-----Input-----
The input consists of:
s: An array of integers containing at least two elements.

-----Output-----
The output is an integer:
Returns the second-smallest number in the input array.

-----Note-----
- The input array is guaranteed to contain at least two elements and is
non-null.
- It is assumed that there exist at least two distinct values in the array to
ensure a unique second-smallest element.
- The original array must remain unmodified.
-/

@[reducible, simp]
def secondSmallest_precond (s : Array Int) : Prop := sorry

def secondSmallest (s : Array Int) (h_precond : secondSmallest_precond s) : Int := sorry

@[reducible, simp]
def secondSmallest_postcond (s : Array Int) (result : Int) (h_precond : secondSmallest_precond s) : Prop := sorry

theorem secondSmallest_spec_satisfied (s : Array Int) (h_precond : secondSmallest_precond s) :
    secondSmallest_postcond s (secondSmallest s h_precond) h_precond := by
  sorry

-- Test Guards

-- Rejected inputs
#guard ¬(secondSmallest_precond (#[1]))

-- Test case 1
#guard secondSmallest_precond (#[5, 3, 1, 4, 2])
#guard secondSmallest_postcond (#[5, 3, 1, 4, 2]) (2) (by aesop)
#guard ¬(secondSmallest_postcond (#[5, 3, 1, 4, 2]) (1) (by aesop))
#guard ¬(secondSmallest_postcond (#[5, 3, 1, 4, 2]) (3) (by aesop))
#guard ¬(secondSmallest_postcond (#[5, 3, 1, 4, 2]) (4) (by aesop))
#guard secondSmallest (#[5, 3, 1, 4, 2]) (by aesop) = (2)

-- Test case 2
#guard secondSmallest_precond (#[7, 2, 5, 3])
#guard secondSmallest_postcond (#[7, 2, 5, 3]) (3) (by aesop)
#guard ¬(secondSmallest_postcond (#[7, 2, 5, 3]) (2) (by aesop))
#guard ¬(secondSmallest_postcond (#[7, 2, 5, 3]) (5) (by aesop))
#guard ¬(secondSmallest_postcond (#[7, 2, 5, 3]) (7) (by aesop))
#guard secondSmallest (#[7, 2, 5, 3]) (by aesop) = (3)

-- Test case 3
#guard secondSmallest_precond (#[10, 20])
#guard secondSmallest_postcond (#[10, 20]) (20) (by aesop)
#guard ¬(secondSmallest_postcond (#[10, 20]) (10) (by aesop))
#guard ¬(secondSmallest_postcond (#[10, 20]) (30) (by aesop))
#guard ¬(secondSmallest_postcond (#[10, 20]) (25) (by aesop))
#guard secondSmallest (#[10, 20]) (by aesop) = (20)

-- Test case 4
#guard secondSmallest_precond (#[20, 10])
#guard secondSmallest_postcond (#[20, 10]) (20) (by aesop)
#guard ¬(secondSmallest_postcond (#[20, 10]) (10) (by aesop))
#guard ¬(secondSmallest_postcond (#[20, 10]) (30) (by aesop))
#guard ¬(secondSmallest_postcond (#[20, 10]) (15) (by aesop))
#guard secondSmallest (#[20, 10]) (by aesop) = (20)

-- Test case 5
#guard secondSmallest_precond (#[3, 1, 2])
#guard secondSmallest_postcond (#[3, 1, 2]) (2) (by aesop)
#guard ¬(secondSmallest_postcond (#[3, 1, 2]) (1) (by aesop))
#guard ¬(secondSmallest_postcond (#[3, 1, 2]) (3) (by aesop))
#guard ¬(secondSmallest_postcond (#[3, 1, 2]) (4) (by aesop))
#guard secondSmallest (#[3, 1, 2]) (by aesop) = (2)
