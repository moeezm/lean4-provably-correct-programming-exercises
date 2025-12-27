import Aesop

/-
-----Description----- 
This task requires writing a Lean 4 method that calculates the surface area of
a cube based on the length of one of its edges. The method should compute the
surface area using the standard formula for a cube.

-----Input-----
The input consists of:
size: An natural number representing the length of an edge of the cube.

-----Output-----
The output is an natural number:
Returns the surface area of the cube.

-/

@[reducible, simp]
def cubeSurfaceArea_precond (size : Nat) : Prop := sorry

def cubeSurfaceArea (size : Nat) (h_precond : cubeSurfaceArea_precond size) : Nat := sorry

@[reducible, simp]
def cubeSurfaceArea_postcond (size : Nat) (result : Nat) (h_precond : cubeSurfaceArea_precond size) : Prop := sorry

theorem cubeSurfaceArea_spec_satisfied (size : Nat) (h_precond : cubeSurfaceArea_precond size) :
    cubeSurfaceArea_postcond size (cubeSurfaceArea size h_precond) h_precond := by
  sorry

-- Test Guards

-- Test case 1
#guard cubeSurfaceArea_precond (3)
#guard cubeSurfaceArea_postcond (3) (54) (by aesop)
#guard ¬(cubeSurfaceArea_postcond (3) (27) (by aesop))
#guard ¬(cubeSurfaceArea_postcond (3) (48) (by aesop))
#guard ¬(cubeSurfaceArea_postcond (3) (60) (by aesop))
#guard cubeSurfaceArea (3) (by aesop) = (54)

-- Test case 2
#guard cubeSurfaceArea_precond (1)
#guard cubeSurfaceArea_postcond (1) (6) (by aesop)
#guard ¬(cubeSurfaceArea_postcond (1) (1) (by aesop))
#guard ¬(cubeSurfaceArea_postcond (1) (2) (by aesop))
#guard ¬(cubeSurfaceArea_postcond (1) (3) (by aesop))
#guard cubeSurfaceArea (1) (by aesop) = (6)

-- Test case 3
#guard cubeSurfaceArea_precond (10)
#guard cubeSurfaceArea_postcond (10) (600) (by aesop)
#guard ¬(cubeSurfaceArea_postcond (10) (100) (by aesop))
#guard ¬(cubeSurfaceArea_postcond (10) (500) (by aesop))
#guard ¬(cubeSurfaceArea_postcond (10) (610) (by aesop))
#guard cubeSurfaceArea (10) (by aesop) = (600)

-- Test case 4
#guard cubeSurfaceArea_precond (5)
#guard cubeSurfaceArea_postcond (5) (150) (by aesop)
#guard ¬(cubeSurfaceArea_postcond (5) (25) (by aesop))
#guard ¬(cubeSurfaceArea_postcond (5) (100) (by aesop))
#guard ¬(cubeSurfaceArea_postcond (5) (125) (by aesop))
#guard cubeSurfaceArea (5) (by aesop) = (150)

-- Test case 5
#guard cubeSurfaceArea_precond (2)
#guard cubeSurfaceArea_postcond (2) (24) (by aesop)
#guard ¬(cubeSurfaceArea_postcond (2) (8) (by aesop))
#guard ¬(cubeSurfaceArea_postcond (2) (16) (by aesop))
#guard ¬(cubeSurfaceArea_postcond (2) (20) (by aesop))
#guard cubeSurfaceArea (2) (by aesop) = (24)
