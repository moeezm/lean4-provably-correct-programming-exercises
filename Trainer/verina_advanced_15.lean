import Aesop

/-
-----Description-----
Given an integer array nums, return true if there exists a triple of indices
(i, j, k) such that i < j < k and nums[i] < nums[j] < nums[k]. If no such
indices exist, return false.

-----Input-----
The input consists of a single list:
nums: A list of integers.

-----Output-----
The output is a boolean:
Returns true if there exists a triplet (i, j, k) where i < j < k and nums[i] <
nums[j] < nums[k]; otherwise, returns false.


-/

@[reducible, simp]
def increasingTriplet_precond (nums : List Int) : Prop := sorry

def increasingTriplet (nums : List Int) (h_precond : increasingTriplet_precond nums) : Bool := sorry

@[reducible, simp]
def increasingTriplet_postcond (nums : List Int) (result : Bool) (h_precond : increasingTriplet_precond nums) : Prop := sorry

theorem increasingTriplet_spec_satisfied (nums : List Int) (h_precond : increasingTriplet_precond nums) :
    increasingTriplet_postcond nums (increasingTriplet nums h_precond) h_precond := by
  sorry

-- Test Guards

-- Test case 1
#guard increasingTriplet_precond ([1, 2, 3])
#guard increasingTriplet_postcond ([1, 2, 3]) (true) (by aesop)
#guard ¬(increasingTriplet_postcond ([1, 2, 3]) (false) (by aesop))
#guard increasingTriplet ([1, 2, 3]) (by aesop) = (true)

-- Test case 2
#guard increasingTriplet_precond ([5, 4, 3, 2, 1])
#guard increasingTriplet_postcond ([5, 4, 3, 2, 1]) (false) (by aesop)
#guard ¬(increasingTriplet_postcond ([5, 4, 3, 2, 1]) (true) (by aesop))
#guard increasingTriplet ([5, 4, 3, 2, 1]) (by aesop) = (false)

-- Test case 3
#guard increasingTriplet_precond ([2, 1, 5, 0, 4, 6])
#guard increasingTriplet_postcond ([2, 1, 5, 0, 4, 6]) (true) (by aesop)
#guard ¬(increasingTriplet_postcond ([2, 1, 5, 0, 4, 6]) (false) (by aesop))
#guard increasingTriplet ([2, 1, 5, 0, 4, 6]) (by aesop) = (true)

-- Test case 4
#guard increasingTriplet_precond ([1, 5, 0, 4, 1, 3])
#guard increasingTriplet_postcond ([1, 5, 0, 4, 1, 3]) (true) (by aesop)
#guard ¬(increasingTriplet_postcond ([1, 5, 0, 4, 1, 3]) (false) (by aesop))
#guard increasingTriplet ([1, 5, 0, 4, 1, 3]) (by aesop) = (true)

-- Test case 5
#guard increasingTriplet_precond ([5, 4, 3])
#guard increasingTriplet_postcond ([5, 4, 3]) (false) (by aesop)
#guard ¬(increasingTriplet_postcond ([5, 4, 3]) (true) (by aesop))
#guard increasingTriplet ([5, 4, 3]) (by aesop) = (false)

-- Test case 6
#guard increasingTriplet_precond ([])
#guard increasingTriplet_postcond ([]) (false) (by aesop)
#guard ¬(increasingTriplet_postcond ([]) (true) (by aesop))
#guard increasingTriplet ([]) (by aesop) = (false)
