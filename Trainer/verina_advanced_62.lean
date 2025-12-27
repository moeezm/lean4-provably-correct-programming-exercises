import Aesop

/-
-----Description----- 
This task requires writing a Lean 4 method that calculates how much rainwater
would be trapped by a terrain represented as an array of heights. Imagine
rainwater falls onto a terrain with varying elevation levels. The water can only
be trapped between higher elevation points.

Given an array of non-negative integers representing the elevation map where
the width of each bar is 1 unit, calculate how much water can be trapped after
it rains.

-----Input-----
The input consists of one array:
heights: An array of non-negative integers representing elevation levels.

-----Output-----
The output is an integer:
Returns the total amount of rainwater that can be trapped.


-/

@[reducible, simp]
def rain_precond (heights : List (Int)) : Prop := sorry

def rain (heights : List (Int)) (h_precond : rain_precond heights) : Int := sorry

@[reducible, simp]
def rain_postcond (heights : List (Int)) (result : Int) (h_precond : rain_precond heights) : Prop := sorry

theorem rain_spec_satisfied (heights : List (Int)) (h_precond : rain_precond heights) :
    rain_postcond heights (rain heights h_precond) h_precond := by
  sorry

-- Test Guards

-- Rejected inputs
#guard ¬(rain_precond ([-1]))

-- Test case 1
#guard rain_precond ([0, 1, 0, 2, 1, 0, 1, 3, 2, 1, 2, 1])
#guard rain_postcond ([0, 1, 0, 2, 1, 0, 1, 3, 2, 1, 2, 1]) (6) (by aesop)
#guard ¬(rain_postcond ([0, 1, 0, 2, 1, 0, 1, 3, 2, 1, 2, 1]) (-1) (by aesop))
#guard ¬(rain_postcond ([0, 1, 0, 2, 1, 0, 1, 3, 2, 1, 2, 1]) (5) (by aesop))
#guard ¬(rain_postcond ([0, 1, 0, 2, 1, 0, 1, 3, 2, 1, 2, 1]) (7) (by aesop))
#guard rain ([0, 1, 0, 2, 1, 0, 1, 3, 2, 1, 2, 1]) (by aesop) = (6)

-- Test case 2
#guard rain_precond ([4, 2, 0, 3, 2, 5])
#guard rain_postcond ([4, 2, 0, 3, 2, 5]) (9) (by aesop)
#guard ¬(rain_postcond ([4, 2, 0, 3, 2, 5]) (-1) (by aesop))
#guard ¬(rain_postcond ([4, 2, 0, 3, 2, 5]) (8) (by aesop))
#guard ¬(rain_postcond ([4, 2, 0, 3, 2, 5]) (10) (by aesop))
#guard rain ([4, 2, 0, 3, 2, 5]) (by aesop) = (9)

-- Test case 3
#guard rain_precond ([1, 1, 1])
#guard rain_postcond ([1, 1, 1]) (0) (by aesop)
#guard ¬(rain_postcond ([1, 1, 1]) (-1) (by aesop))
#guard ¬(rain_postcond ([1, 1, 1]) (3) (by aesop))
#guard ¬(rain_postcond ([1, 1, 1]) (1) (by aesop))
#guard rain ([1, 1, 1]) (by aesop) = (0)

-- Test case 4
#guard rain_precond ([10, 5])
#guard rain_postcond ([10, 5]) (0) (by aesop)
#guard ¬(rain_postcond ([10, 5]) (-1) (by aesop))
#guard ¬(rain_postcond ([10, 5]) (5) (by aesop))
#guard ¬(rain_postcond ([10, 5]) (10) (by aesop))
#guard rain ([10, 5]) (by aesop) = (0)

-- Test case 5
#guard rain_precond ([1, 10, 9, 11])
#guard rain_postcond ([1, 10, 9, 11]) (1) (by aesop)
#guard ¬(rain_postcond ([1, 10, 9, 11]) (-1) (by aesop))
#guard ¬(rain_postcond ([1, 10, 9, 11]) (9) (by aesop))
#guard ¬(rain_postcond ([1, 10, 9, 11]) (2) (by aesop))
#guard rain ([1, 10, 9, 11]) (by aesop) = (1)

-- Test case 6
#guard rain_precond ([])
#guard rain_postcond ([]) (0) (by aesop)
#guard ¬(rain_postcond ([]) (-1) (by aesop))
#guard ¬(rain_postcond ([]) (100) (by aesop))
#guard rain ([]) (by aesop) = (0)
