import Aesop

/-
-----Description-----  
This task involves determining the triple of a given integer. The goal is to
create a function that, for any integer provided as input, returns a value equal
to three times that integer, including handling the case when the input is zero.

-----Input-----  
The input consists of:  
• x: An integer.

-----Output-----  
The output is an integer that represents three times the input integer.  
• If x = 0, the output will be 0.  
• Otherwise, the output will be computed as x + 2 * x, which is equivalent to 3
* x.

-----Note-----  
There are no additional preconditions. It is assumed that x is a valid integer.
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
#guard ¬(Triple_postcond (0) (1) (by aesop))
#guard ¬(Triple_postcond (0) (-1) (by aesop))
#guard ¬(Triple_postcond (0) (10) (by aesop))
#guard Triple (0) (by aesop) = (0)

-- Test case 2
#guard Triple_precond (1)
#guard Triple_postcond (1) (3) (by aesop)
#guard ¬(Triple_postcond (1) (2) (by aesop))
#guard ¬(Triple_postcond (1) (4) (by aesop))
#guard ¬(Triple_postcond (1) (0) (by aesop))
#guard Triple (1) (by aesop) = (3)

-- Test case 3
#guard Triple_precond (-2)
#guard Triple_postcond (-2) (-6) (by aesop)
#guard ¬(Triple_postcond (-2) (-4) (by aesop))
#guard ¬(Triple_postcond (-2) (-2) (by aesop))
#guard ¬(Triple_postcond (-2) (6) (by aesop))
#guard Triple (-2) (by aesop) = (-6)

-- Test case 4
#guard Triple_precond (10)
#guard Triple_postcond (10) (30) (by aesop)
#guard ¬(Triple_postcond (10) (20) (by aesop))
#guard ¬(Triple_postcond (10) (40) (by aesop))
#guard ¬(Triple_postcond (10) (0) (by aesop))
#guard Triple (10) (by aesop) = (30)

-- Test case 5
#guard Triple_precond (-5)
#guard Triple_postcond (-5) (-15) (by aesop)
#guard ¬(Triple_postcond (-5) (-10) (by aesop))
#guard ¬(Triple_postcond (-5) (-5) (by aesop))
#guard ¬(Triple_postcond (-5) (15) (by aesop))
#guard Triple (-5) (by aesop) = (-15)
