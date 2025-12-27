import Aesop

/-
-----Description-----  
This problem involves computing the triple of a given integer. The goal is to
produce an output that is exactly three times the input value.

-----Input-----  
The input consists of:  
• x: An integer representing the value to be tripled.

-----Output-----  
The output is an integer that is three times the input value (i.e., 3 * x).

-----Note-----  
The implementation uses a local variable to first compute double the input and
then adds the original input to get the final result. The accompanying theorem
asserts that the function satisfies the specification of computing 3 * x.
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
#guard ¬(Triple_postcond (0) (2) (by aesop))
#guard Triple (0) (by aesop) = (0)

-- Test case 2
#guard Triple_precond (1)
#guard Triple_postcond (1) (3) (by aesop)
#guard ¬(Triple_postcond (1) (2) (by aesop))
#guard ¬(Triple_postcond (1) (4) (by aesop))
#guard ¬(Triple_postcond (1) (5) (by aesop))
#guard Triple (1) (by aesop) = (3)

-- Test case 3
#guard Triple_precond (-1)
#guard Triple_postcond (-1) (-3) (by aesop)
#guard ¬(Triple_postcond (-1) (-2) (by aesop))
#guard ¬(Triple_postcond (-1) (0) (by aesop))
#guard ¬(Triple_postcond (-1) (-1) (by aesop))
#guard Triple (-1) (by aesop) = (-3)

-- Test case 4
#guard Triple_precond (5)
#guard Triple_postcond (5) (15) (by aesop)
#guard ¬(Triple_postcond (5) (14) (by aesop))
#guard ¬(Triple_postcond (5) (16) (by aesop))
#guard ¬(Triple_postcond (5) (10) (by aesop))
#guard Triple (5) (by aesop) = (15)

-- Test case 5
#guard Triple_precond (-10)
#guard Triple_postcond (-10) (-30) (by aesop)
#guard ¬(Triple_postcond (-10) (-20) (by aesop))
#guard ¬(Triple_postcond (-10) (-40) (by aesop))
#guard ¬(Triple_postcond (-10) (-10) (by aesop))
#guard Triple (-10) (by aesop) = (-30)
