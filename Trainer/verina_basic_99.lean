import Aesop

/-
-----Description-----  
This task requires computing three times the given integer. The goal is to
determine the product of the input integer and 3.

-----Input-----  
The input consists of:  
• x: An integer.

-----Output-----  
The output is an integer that represents three times the input value.

-----Note-----  
The implementation uses two different branches based on the value of x (i.e., x
< 18 or x ≥ 18), but both branches guarantee that the result equals 3*x.
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
#guard Triple_precond (10)
#guard Triple_postcond (10) (30) (by aesop)
#guard ¬(Triple_postcond (10) (20) (by aesop))
#guard ¬(Triple_postcond (10) (25) (by aesop))
#guard ¬(Triple_postcond (10) (35) (by aesop))
#guard Triple (10) (by aesop) = (30)

-- Test case 2
#guard Triple_precond (18)
#guard Triple_postcond (18) (54) (by aesop)
#guard ¬(Triple_postcond (18) (50) (by aesop))
#guard ¬(Triple_postcond (18) (56) (by aesop))
#guard ¬(Triple_postcond (18) (60) (by aesop))
#guard Triple (18) (by aesop) = (54)

-- Test case 3
#guard Triple_precond (0)
#guard Triple_postcond (0) (0) (by aesop)
#guard ¬(Triple_postcond (0) (1) (by aesop))
#guard ¬(Triple_postcond (0) (-1) (by aesop))
#guard ¬(Triple_postcond (0) (5) (by aesop))
#guard Triple (0) (by aesop) = (0)

-- Test case 4
#guard Triple_precond (-5)
#guard Triple_postcond (-5) (-15) (by aesop)
#guard ¬(Triple_postcond (-5) (-10) (by aesop))
#guard ¬(Triple_postcond (-5) (-20) (by aesop))
#guard ¬(Triple_postcond (-5) (0) (by aesop))
#guard Triple (-5) (by aesop) = (-15)

-- Test case 5
#guard Triple_precond (25)
#guard Triple_postcond (25) (75) (by aesop)
#guard ¬(Triple_postcond (25) (70) (by aesop))
#guard ¬(Triple_postcond (25) (80) (by aesop))
#guard ¬(Triple_postcond (25) (65) (by aesop))
#guard Triple (25) (by aesop) = (75)
