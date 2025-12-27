import Aesop

/-
-----Description-----
This task involves computing three times a given integer. Given an integer, the
goal is to produce a value that is exactly three times its value.

-----Input-----
The input consists of a single integer:
x: An integer.

-----Output-----
The output is an integer:
Returns the product of the input integer and 3.

-----Note-----
There are no additional preconditions.
-/

@[reducible, simp]
def Triple_precond (x : Int) : Prop := sorry

def Triple (x : Int) (h_precond : Triple_precond x) : Int := sorry

@[reducible, simp]
def Triple_postcond (x : Int) (result : Int) (h_precond : Triple_precond x) : Prop := sorry

theorem Triple_spec_satisfied (x : Int) (h_precond : Triple_precond x) :
    Triple_postcond x (Triple x h_precond) h_precond := by
  sorry

-- Test Guards

-- Test case 1
#guard Triple_precond (0)
#guard Triple_postcond (0) (0) (by aesop)
#guard ¬(Triple_postcond (0) (-1) (by aesop))
#guard ¬(Triple_postcond (0) (1) (by aesop))
#guard ¬(Triple_postcond (0) (2) (by aesop))
#guard Triple (0) (by aesop) = (0)

-- Test case 2
#guard Triple_precond (2)
#guard Triple_postcond (2) (6) (by aesop)
#guard ¬(Triple_postcond (2) (4) (by aesop))
#guard ¬(Triple_postcond (2) (5) (by aesop))
#guard ¬(Triple_postcond (2) (7) (by aesop))
#guard Triple (2) (by aesop) = (6)

-- Test case 3
#guard Triple_precond (-4)
#guard Triple_postcond (-4) (-12) (by aesop)
#guard ¬(Triple_postcond (-4) (-8) (by aesop))
#guard ¬(Triple_postcond (-4) (-10) (by aesop))
#guard ¬(Triple_postcond (-4) (-16) (by aesop))
#guard Triple (-4) (by aesop) = (-12)

-- Test case 4
#guard Triple_precond (10)
#guard Triple_postcond (10) (30) (by aesop)
#guard ¬(Triple_postcond (10) (20) (by aesop))
#guard ¬(Triple_postcond (10) (25) (by aesop))
#guard ¬(Triple_postcond (10) (35) (by aesop))
#guard Triple (10) (by aesop) = (30)

-- Test case 5
#guard Triple_precond (-1)
#guard Triple_postcond (-1) (-3) (by aesop)
#guard ¬(Triple_postcond (-1) (-2) (by aesop))
#guard ¬(Triple_postcond (-1) (-4) (by aesop))
#guard ¬(Triple_postcond (-1) (0) (by aesop))
#guard Triple (-1) (by aesop) = (-3)
