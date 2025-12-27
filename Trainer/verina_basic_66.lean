import Aesop

/-
-----Description-----  
This task focuses on determining if a given integer is even. The problem
requires checking whether the integer can be represented as twice another
integer, meaning it is divisible by 2 without any remainder.

-----Input-----  
The input consists of a single integer:  
• x: An integer to be evaluated.

-----Output-----  
The output is a boolean value:  
• true if x is even (x mod 2 equals 0).  
• false if x is odd.

-----Note-----  
No additional preconditions are required. The method should work correctly for
any integer value.
-/

@[reducible, simp]
def ComputeIsEven_precond (x : Int) : Prop := sorry

def ComputeIsEven (x : Int) (h_precond : ComputeIsEven_precond x) : Bool := sorry

@[reducible, simp]
def ComputeIsEven_postcond (x : Int) (result : Bool) (h_precond : ComputeIsEven_precond x) : Prop := sorry

theorem ComputeIsEven_spec_satisfied (x : Int) (h_precond : ComputeIsEven_precond x) :
    ComputeIsEven_postcond x (ComputeIsEven x h_precond) h_precond := by
  sorry

-- Test Guards

-- Test case 1
#guard ComputeIsEven_precond (4)
#guard ComputeIsEven_postcond (4) (true) (by aesop)
#guard ¬(ComputeIsEven_postcond (4) (false) (by aesop))
#guard ComputeIsEven (4) (by aesop) = (true)

-- Test case 2
#guard ComputeIsEven_precond (7)
#guard ComputeIsEven_postcond (7) (false) (by aesop)
#guard ¬(ComputeIsEven_postcond (7) (true) (by aesop))
#guard ComputeIsEven (7) (by aesop) = (false)

-- Test case 3
#guard ComputeIsEven_precond (0)
#guard ComputeIsEven_postcond (0) (true) (by aesop)
#guard ¬(ComputeIsEven_postcond (0) (false) (by aesop))
#guard ComputeIsEven (0) (by aesop) = (true)

-- Test case 4
#guard ComputeIsEven_precond (-2)
#guard ComputeIsEven_postcond (-2) (true) (by aesop)
#guard ¬(ComputeIsEven_postcond (-2) (false) (by aesop))
#guard ComputeIsEven (-2) (by aesop) = (true)

-- Test case 5
#guard ComputeIsEven_precond (-3)
#guard ComputeIsEven_postcond (-3) (false) (by aesop)
#guard ¬(ComputeIsEven_postcond (-3) (true) (by aesop))
#guard ComputeIsEven (-3) (by aesop) = (false)
