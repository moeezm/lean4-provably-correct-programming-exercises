import Aesop

/-
-----Description-----
This task requires writing a Lean 4 method that finds the indices of two
numbers in an array that add up to a target value. Given an array of integers
and a target integer, the function should return the indices of the two numbers
such that they add up to the target.

You may assume that each input has exactly one solution, and you may not use
the same element twice.

-----Input-----
The input consists of:
nums: An array of integers.
target: An integer representing the target sum.

-----Output-----
The output is an array of two integers:
Returns the indices of the two numbers in the array that add up to the target.
The indices should be sorted.


-/

@[reducible, simp]
def twoSum_precond (nums : Array Int) (target : Int) : Prop := sorry

def twoSum (nums : Array Int) (target : Int) (h_precond : twoSum_precond nums target) : Array Nat := sorry

@[reducible, simp]
def twoSum_postcond (nums : Array Int) (target : Int) (result : Array Nat) (h_precond : twoSum_precond nums target) : Prop := sorry

theorem twoSum_spec_satisfied (nums : Array Int) (target : Int) (h_precond : twoSum_precond nums target) :
    twoSum_postcond nums target (twoSum nums target h_precond) h_precond := by
  sorry

-- Test Guards

-- Rejected inputs
#guard ¬(twoSum_precond (#[0]) (2))

-- Test case 1
#guard twoSum_precond (#[2, 7, 11, 15]) (9)
#guard twoSum_postcond (#[2, 7, 11, 15]) (9) (#[0, 1]) (by aesop)
#guard ¬(twoSum_postcond (#[2, 7, 11, 15]) (9) (#[1, 0]) (by aesop))
#guard ¬(twoSum_postcond (#[2, 7, 11, 15]) (9) (#[2, 3]) (by aesop))
#guard ¬(twoSum_postcond (#[2, 7, 11, 15]) (9) (#[0, 3]) (by aesop))
#guard twoSum (#[2, 7, 11, 15]) (9) (by aesop) = (#[0, 1])

-- Test case 2
#guard twoSum_precond (#[3, 2, 4]) (6)
#guard twoSum_postcond (#[3, 2, 4]) (6) (#[1, 2]) (by aesop)
#guard ¬(twoSum_postcond (#[3, 2, 4]) (6) (#[0, 1]) (by aesop))
#guard ¬(twoSum_postcond (#[3, 2, 4]) (6) (#[0, 2]) (by aesop))
#guard ¬(twoSum_postcond (#[3, 2, 4]) (6) (#[0, 3]) (by aesop))
#guard twoSum (#[3, 2, 4]) (6) (by aesop) = (#[1, 2])

-- Test case 3
#guard twoSum_precond (#[3, 3]) (6)
#guard twoSum_postcond (#[3, 3]) (6) (#[0, 1]) (by aesop)
#guard ¬(twoSum_postcond (#[3, 3]) (6) (#[1, 0]) (by aesop))
#guard ¬(twoSum_postcond (#[3, 3]) (6) (#[2, 2]) (by aesop))
#guard twoSum (#[3, 3]) (6) (by aesop) = (#[0, 1])

-- Test case 4
#guard twoSum_precond (#[1, 2, 3, 4, 5]) (9)
#guard twoSum_postcond (#[1, 2, 3, 4, 5]) (9) (#[3, 4]) (by aesop)
#guard ¬(twoSum_postcond (#[1, 2, 3, 4, 5]) (9) (#[0, 4]) (by aesop))
#guard ¬(twoSum_postcond (#[1, 2, 3, 4, 5]) (9) (#[1, 3]) (by aesop))
#guard ¬(twoSum_postcond (#[1, 2, 3, 4, 5]) (9) (#[2, 2]) (by aesop))
#guard twoSum (#[1, 2, 3, 4, 5]) (9) (by aesop) = (#[3, 4])

-- Test case 5
#guard twoSum_precond (#[0, 4, 3, 0]) (0)
#guard twoSum_postcond (#[0, 4, 3, 0]) (0) (#[0, 3]) (by aesop)
#guard ¬(twoSum_postcond (#[0, 4, 3, 0]) (0) (#[1, 2]) (by aesop))
#guard ¬(twoSum_postcond (#[0, 4, 3, 0]) (0) (#[2, 1]) (by aesop))
#guard twoSum (#[0, 4, 3, 0]) (0) (by aesop) = (#[0, 3])
