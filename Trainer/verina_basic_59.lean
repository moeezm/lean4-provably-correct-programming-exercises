import Aesop

/-
-----Description-----  
Given an integer x, determine a pair (a, b) where the first element is twice
the value of x and the second element is four times the value of x.

-----Input-----  
The input consists of:  
• x: An integer.

-----Output-----  
The output is a tuple (a, b) where:  
• a = 2 * x  
• b = 4 * x

-----Note-----  
There are no additional preconditions; the method is defined for all integers.
-/

@[reducible, simp]
def DoubleQuadruple_precond (x : Int) : Prop := sorry

def DoubleQuadruple (x : Int) (h_precond : DoubleQuadruple_precond x) : (Int × Int) := sorry

@[reducible, simp]
def DoubleQuadruple_postcond (x : Int) (result : (Int × Int)) (h_precond : DoubleQuadruple_precond x) : Prop := sorry

theorem DoubleQuadruple_spec_satisfied (x : Int) (h_precond : DoubleQuadruple_precond x) :
    DoubleQuadruple_postcond x (DoubleQuadruple x h_precond) h_precond := by
  sorry

-- Test Guards

-- Test case 1
#guard DoubleQuadruple_precond (0)
#guard DoubleQuadruple_postcond (0) ("(0, 0)") (by aesop)
#guard ¬(DoubleQuadruple_postcond (0) ("(1, 0)") (by aesop))
#guard ¬(DoubleQuadruple_postcond (0) ("(0, 1)") (by aesop))
#guard ¬(DoubleQuadruple_postcond (0) ("(-1, 0)") (by aesop))
#guard DoubleQuadruple (0) (by aesop) = ("(0, 0)")

-- Test case 2
#guard DoubleQuadruple_precond (1)
#guard DoubleQuadruple_postcond (1) ("(2, 4)") (by aesop)
#guard ¬(DoubleQuadruple_postcond (1) ("(2, 2)") (by aesop))
#guard ¬(DoubleQuadruple_postcond (1) ("(1, 4)") (by aesop))
#guard ¬(DoubleQuadruple_postcond (1) ("(3, 4)") (by aesop))
#guard DoubleQuadruple (1) (by aesop) = ("(2, 4)")

-- Test case 3
#guard DoubleQuadruple_precond (-1)
#guard DoubleQuadruple_postcond (-1) ("(-2, -4)") (by aesop)
#guard ¬(DoubleQuadruple_postcond (-1) ("(-2, -2)") (by aesop))
#guard ¬(DoubleQuadruple_postcond (-1) ("(-1, -4)") (by aesop))
#guard ¬(DoubleQuadruple_postcond (-1) ("(-3, -4)") (by aesop))
#guard DoubleQuadruple (-1) (by aesop) = ("(-2, -4)")

-- Test case 4
#guard DoubleQuadruple_precond (10)
#guard DoubleQuadruple_postcond (10) ("(20, 40)") (by aesop)
#guard ¬(DoubleQuadruple_postcond (10) ("(20, 20)") (by aesop))
#guard ¬(DoubleQuadruple_postcond (10) ("(10, 40)") (by aesop))
#guard ¬(DoubleQuadruple_postcond (10) ("(20, 0)") (by aesop))
#guard DoubleQuadruple (10) (by aesop) = ("(20, 40)")

-- Test case 5
#guard DoubleQuadruple_precond (-5)
#guard DoubleQuadruple_postcond (-5) ("(-10, -20)") (by aesop)
#guard ¬(DoubleQuadruple_postcond (-5) ("(-10, -10)") (by aesop))
#guard ¬(DoubleQuadruple_postcond (-5) ("(-5, -20)") (by aesop))
#guard ¬(DoubleQuadruple_postcond (-5) ("(-15, -20)") (by aesop))
#guard DoubleQuadruple (-5) (by aesop) = ("(-10, -20)")
