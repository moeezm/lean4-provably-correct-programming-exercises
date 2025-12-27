import Aesop

/-
-----Description----- 
This task requires writing a Lean 4 method that solves the Two Sum problem.
Given a list of integers and a target integer, the method must return a pair of
indices such that the sum of the numbers at those indices equals the target. You
may assume that each input has exactly one solution and that you may not use the
same element twice. The answer should be returned with first index is smaller
than the second.

-----Input-----
The input consists of:
- nums: A list of integers.
- target: An integer representing the target sum.

-----Output-----
The output is a pair (tuple) of integers representing the indices of the two
numbers in the input list that add up to the target.


-/

@[reducible, simp]
def twoSum_precond (nums : List Int) (target : Int) : Prop := sorry

def twoSum (nums : List Int) (target : Int) (h_precond : twoSum_precond nums target) : Prod Nat Nat := sorry

@[reducible, simp]
def twoSum_postcond (nums : List Int) (target : Int) (result : Prod Nat Nat) (h_precond : twoSum_precond nums target) : Prop := sorry

theorem twoSum_spec_satisfied (nums : List Int) (target : Int) (h_precond : twoSum_precond nums target) :
    twoSum_postcond nums target (twoSum nums target h_precond) h_precond := by
  sorry

-- Test Guards

-- Rejected inputs
#guard ¬(twoSum_precond ([1, 2]) (0))

-- Test case 1
#guard twoSum_precond ([2, 7, 11, 15]) (9)
#guard twoSum_postcond ([2, 7, 11, 15]) (9) ("(0, 1)") (by aesop)
#guard ¬(twoSum_postcond ([2, 7, 11, 15]) (9) ("(2, 3)") (by aesop))
#guard twoSum ([2, 7, 11, 15]) (9) (by aesop) = ("(0, 1)")

-- Test case 2
#guard twoSum_precond ([3, 2, 4]) (6)
#guard twoSum_postcond ([3, 2, 4]) (6) ("(1, 2)") (by aesop)
#guard ¬(twoSum_postcond ([3, 2, 4]) (6) ("(0, 2)") (by aesop))
#guard twoSum ([3, 2, 4]) (6) (by aesop) = ("(1, 2)")

-- Test case 3
#guard twoSum_precond ([3, 3]) (6)
#guard twoSum_postcond ([3, 3]) (6) ("(0, 1)") (by aesop)
#guard ¬(twoSum_postcond ([3, 3]) (6) ("(1, 0)") (by aesop))
#guard twoSum ([3, 3]) (6) (by aesop) = ("(0, 1)")

-- Test case 4
#guard twoSum_precond ([1, 2, 3, 4]) (7)
#guard twoSum_postcond ([1, 2, 3, 4]) (7) ("(2, 3)") (by aesop)
#guard ¬(twoSum_postcond ([1, 2, 3, 4]) (7) ("(0, 1)") (by aesop))
#guard twoSum ([1, 2, 3, 4]) (7) (by aesop) = ("(2, 3)")

-- Test case 5
#guard twoSum_precond ([0, 4, 3, 0]) (0)
#guard twoSum_postcond ([0, 4, 3, 0]) (0) ("(0, 3)") (by aesop)
#guard ¬(twoSum_postcond ([0, 4, 3, 0]) (0) ("(1, 2)") (by aesop))
#guard twoSum ([0, 4, 3, 0]) (0) (by aesop) = ("(0, 3)")
