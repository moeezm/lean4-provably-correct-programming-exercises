import Aesop

/-
-----Description----- 
This task requires writing a Lean 4 method that determines whether a given
integer is even. In other words, the method should return true if the number is
even and false if the number is odd.

-----Input-----
The input consists of:
n: An integer.

-----Output-----
The output is a Boolean value:
Returns true if the input number is even.
Returns false if the input number is odd.

-----Note-----
There are no preconditions; the method will always work for any integer input.
-/

@[reducible, simp]
def isEven_precond (n : Int) : Prop := sorry

def isEven (n : Int) (h_precond : isEven_precond n) : Bool := sorry

@[reducible, simp]
def isEven_postcond (n : Int) (result : Bool) (h_precond : isEven_precond n) : Prop := sorry

theorem isEven_spec_satisfied (n : Int) (h_precond : isEven_precond n) :
    isEven_postcond n (isEven n h_precond) h_precond := by
  sorry

-- Test Guards

-- Test case 1
#guard isEven_precond (4)
#guard isEven_postcond (4) (true) (by aesop)
#guard ¬(isEven_postcond (4) (false) (by aesop))
#guard isEven (4) (by aesop) = (true)

-- Test case 2
#guard isEven_precond (7)
#guard isEven_postcond (7) (false) (by aesop)
#guard ¬(isEven_postcond (7) (true) (by aesop))
#guard isEven (7) (by aesop) = (false)

-- Test case 3
#guard isEven_precond (0)
#guard isEven_postcond (0) (true) (by aesop)
#guard ¬(isEven_postcond (0) (false) (by aesop))
#guard isEven (0) (by aesop) = (true)

-- Test case 4
#guard isEven_precond (-2)
#guard isEven_postcond (-2) (true) (by aesop)
#guard ¬(isEven_postcond (-2) (false) (by aesop))
#guard isEven (-2) (by aesop) = (true)

-- Test case 5
#guard isEven_precond (-3)
#guard isEven_postcond (-3) (false) (by aesop)
#guard ¬(isEven_postcond (-3) (true) (by aesop))
#guard isEven (-3) (by aesop) = (false)
