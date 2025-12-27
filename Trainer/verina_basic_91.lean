import Aesop

/-
-----Description-----  
This task involves creating a function that swaps two integer values. Given two
integers, the function should return a pair where the first element is the
second input value and the second element is the first input value.

-----Input-----  
The input consists of two integers:  
• X: An integer representing the first value.  
• Y: An integer representing the second value.

-----Output-----  
The output is a pair (Int × Int) that:  
• Contains the original Y as the first element.  
• Contains the original X as the second element.

-----Note-----  
There are no additional preconditions. The function simply swaps the two input
values.
-/

@[reducible, simp]
def Swap_precond (X : Int) (Y : Int) : Prop := sorry

def Swap (X : Int) (Y : Int) (h_precond : Swap_precond X Y) : Int × Int := sorry

@[reducible, simp]
def Swap_postcond (X : Int) (Y : Int) (result : Int × Int) (h_precond : Swap_precond X Y) : Prop := sorry

theorem Swap_spec_satisfied (X : Int) (Y : Int) (h_precond : Swap_precond X Y) :
    Swap_postcond X Y (Swap X Y h_precond) h_precond := by
  sorry

-- Test Guards

-- Test case 1
#guard Swap_precond (1) (2)
#guard Swap_postcond (1) (2) ("(2, 1)") (by aesop)
#guard ¬(Swap_postcond (1) (2) ("(1, 2)") (by aesop))
#guard ¬(Swap_postcond (1) (2) ("(2, 2)") (by aesop))
#guard Swap (1) (2) (by aesop) = ("(2, 1)")

-- Test case 2
#guard Swap_precond (0) (0)
#guard Swap_postcond (0) (0) ("(0, 0)") (by aesop)
#guard ¬(Swap_postcond (0) (0) ("(0, 1)") (by aesop))
#guard ¬(Swap_postcond (0) (0) ("(1, 0)") (by aesop))
#guard Swap (0) (0) (by aesop) = ("(0, 0)")

-- Test case 3
#guard Swap_precond (-1) (5)
#guard Swap_postcond (-1) (5) ("(5, -1)") (by aesop)
#guard ¬(Swap_postcond (-1) (5) ("(-1, 5)") (by aesop))
#guard ¬(Swap_postcond (-1) (5) ("(5, 5)") (by aesop))
#guard Swap (-1) (5) (by aesop) = ("(5, -1)")

-- Test case 4
#guard Swap_precond (100) (-100)
#guard Swap_postcond (100) (-100) ("(-100, 100)") (by aesop)
#guard ¬(Swap_postcond (100) (-100) ("(100, -100)") (by aesop))
#guard ¬(Swap_postcond (100) (-100) ("(-100, -100)") (by aesop))
#guard Swap (100) (-100) (by aesop) = ("(-100, 100)")

-- Test case 5
#guard Swap_precond (42) (42)
#guard Swap_postcond (42) (42) ("(42, 42)") (by aesop)
#guard ¬(Swap_postcond (42) (42) ("(41, 42)") (by aesop))
#guard ¬(Swap_postcond (42) (42) ("(42, 41)") (by aesop))
#guard Swap (42) (42) (by aesop) = ("(42, 42)")
