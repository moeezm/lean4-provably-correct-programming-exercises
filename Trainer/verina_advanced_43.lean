import Aesop

/-
------Description-----
This task requires writing a Lean 4 method that given a 0-indexed integer array
`nums` representing the scores of students in an exam. A teacher wants to select
a non empty group of students such that the strength of group is maximized.

The strength of a group is defined as the product of the selected student
scores.

You can choose any non-empty subset of students. The goal is to compute the
maximum product of any such subset.


----Input---
nums: An non-empty list of integers.

-----Output-----

An integer representing the maximum strength.


-/

@[reducible, simp]
def maxStrength_precond (nums : List Int) : Prop := sorry

def maxStrength (nums : List Int) (h_precond : maxStrength_precond nums) : Int := sorry

@[reducible, simp]
def maxStrength_postcond (nums : List Int) (result : Int) (h_precond : maxStrength_precond nums) : Prop := sorry

theorem maxStrength_spec_satisfied (nums : List Int) (h_precond : maxStrength_precond nums) :
    maxStrength_postcond nums (maxStrength nums h_precond) h_precond := by
  sorry

-- Test Guards

-- Rejected inputs
#guard ¬(maxStrength_precond ([]))

-- Test case 1
#guard maxStrength_precond ([-2])
#guard maxStrength_postcond ([-2]) (-2) (by aesop)
#guard ¬(maxStrength_postcond ([-2]) (2) (by aesop))
#guard ¬(maxStrength_postcond ([-2]) (0) (by aesop))
#guard maxStrength ([-2]) (by aesop) = (-2)

-- Test case 2
#guard maxStrength_precond ([3, -1, -5, 2, 5, -9])
#guard maxStrength_postcond ([3, -1, -5, 2, 5, -9]) (1350) (by aesop)
#guard ¬(maxStrength_postcond ([3, -1, -5, 2, 5, -9]) (270) (by aesop))
#guard ¬(maxStrength_postcond ([3, -1, -5, 2, 5, -9]) (0) (by aesop))
#guard ¬(maxStrength_postcond ([3, -1, -5, 2, 5, -9]) (-1) (by aesop))
#guard maxStrength ([3, -1, -5, 2, 5, -9]) (by aesop) = (1350)

-- Test case 3
#guard maxStrength_precond ([-4, -5, -4])
#guard maxStrength_postcond ([-4, -5, -4]) (20) (by aesop)
#guard ¬(maxStrength_postcond ([-4, -5, -4]) (80) (by aesop))
#guard ¬(maxStrength_postcond ([-4, -5, -4]) (-80) (by aesop))
#guard ¬(maxStrength_postcond ([-4, -5, -4]) (-5) (by aesop))
#guard maxStrength ([-4, -5, -4]) (by aesop) = (20)

-- Test case 4
#guard maxStrength_precond ([0, -3, 4])
#guard maxStrength_postcond ([0, -3, 4]) (4) (by aesop)
#guard ¬(maxStrength_postcond ([0, -3, 4]) (0) (by aesop))
#guard ¬(maxStrength_postcond ([0, -3, 4]) (-12) (by aesop))
#guard maxStrength ([0, -3, 4]) (by aesop) = (4)

-- Test case 5
#guard maxStrength_precond ([1, -1, -1])
#guard maxStrength_postcond ([1, -1, -1]) (1) (by aesop)
#guard ¬(maxStrength_postcond ([1, -1, -1]) (-1) (by aesop))
#guard ¬(maxStrength_postcond ([1, -1, -1]) (-2) (by aesop))
#guard maxStrength ([1, -1, -1]) (by aesop) = (1)
