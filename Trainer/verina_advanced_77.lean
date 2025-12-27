import Aesop

/-
-----Description-----
This task requires writing a Lean 4 function that calculates how much water can
be trapped between elevations after it rains. The input is a list of
non-negative integers representing an elevation map. Each index traps water
depending on the min of max heights to its left and right.

-----Input-----
- height: A list of natural numbers representing elevations.

-----Output-----
- A natural number: total units of water that can be trapped.


-/

@[reducible, simp]
def trapRainWater_precond (height : List Nat) : Prop := sorry

def trapRainWater (height : List Nat) (h_precond : trapRainWater_precond height) : Nat := sorry

@[reducible, simp]
def trapRainWater_postcond (height : List Nat) (result : Nat) (h_precond : trapRainWater_precond height) : Prop := sorry

theorem trapRainWater_spec_satisfied (height : List Nat) (h_precond : trapRainWater_precond height) :
    trapRainWater_postcond height (trapRainWater height h_precond) h_precond := by
  sorry

-- Test Guards

-- Test case 1
#guard trapRainWater_precond ([0, 1, 0, 2, 1, 0, 1, 3, 2, 1, 2, 1])
#guard trapRainWater_postcond ([0, 1, 0, 2, 1, 0, 1, 3, 2, 1, 2, 1]) (6) (by aesop)
#guard ¬(trapRainWater_postcond ([0, 1, 0, 2, 1, 0, 1, 3, 2, 1, 2, 1]) (5) (by aesop))
#guard ¬(trapRainWater_postcond ([0, 1, 0, 2, 1, 0, 1, 3, 2, 1, 2, 1]) (7) (by aesop))
#guard trapRainWater ([0, 1, 0, 2, 1, 0, 1, 3, 2, 1, 2, 1]) (by aesop) = (6)

-- Test case 2
#guard trapRainWater_precond ([4, 2, 0, 3, 2, 5])
#guard trapRainWater_postcond ([4, 2, 0, 3, 2, 5]) (9) (by aesop)
#guard ¬(trapRainWater_postcond ([4, 2, 0, 3, 2, 5]) (8) (by aesop))
#guard trapRainWater ([4, 2, 0, 3, 2, 5]) (by aesop) = (9)

-- Test case 3
#guard trapRainWater_precond ([1, 0, 2])
#guard trapRainWater_postcond ([1, 0, 2]) (1) (by aesop)
#guard ¬(trapRainWater_postcond ([1, 0, 2]) (0) (by aesop))
#guard ¬(trapRainWater_postcond ([1, 0, 2]) (2) (by aesop))
#guard trapRainWater ([1, 0, 2]) (by aesop) = (1)

-- Test case 4
#guard trapRainWater_precond ([3, 0, 1, 3, 0, 5])
#guard trapRainWater_postcond ([3, 0, 1, 3, 0, 5]) (8) (by aesop)
#guard ¬(trapRainWater_postcond ([3, 0, 1, 3, 0, 5]) (6) (by aesop))
#guard trapRainWater ([3, 0, 1, 3, 0, 5]) (by aesop) = (8)

-- Test case 5
#guard trapRainWater_precond ([0, 1, 2, 3, 4, 5])
#guard trapRainWater_postcond ([0, 1, 2, 3, 4, 5]) (0) (by aesop)
#guard ¬(trapRainWater_postcond ([0, 1, 2, 3, 4, 5]) (1) (by aesop))
#guard trapRainWater ([0, 1, 2, 3, 4, 5]) (by aesop) = (0)

-- Test case 6
#guard trapRainWater_precond ([])
#guard trapRainWater_postcond ([]) (0) (by aesop)
#guard ¬(trapRainWater_postcond ([]) (1) (by aesop))
#guard trapRainWater ([]) (by aesop) = (0)
