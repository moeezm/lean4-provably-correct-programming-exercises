import Aesop

/-
-----Description----- 
This task requires writing a Lean 4 method that determines whether two given
integers have opposite signs. In other words, the method should return true if
one integer is positive and the other is negative. Note that zero is considered
neither positive nor negative; therefore, if either integer is zero, the method
should return false.

-----Input-----
The input consists of two integers:
a: An integer.
b: An integer.

-----Output-----
The output is a Boolean value:
Returns true if one of the integers is positive and the other is negative
(i.e., they have opposite signs).
Returns false if both integers are either non-negative or non-positive, or if
one (or both) is zero.
-/

@[reducible, simp]
def hasOppositeSign_precond (a : Int) (b : Int) : Prop := sorry

def hasOppositeSign (a : Int) (b : Int) (h_precond : hasOppositeSign_precond a b) : Bool := sorry

@[reducible, simp]
def hasOppositeSign_postcond (a : Int) (b : Int) (result : Bool) (h_precond : hasOppositeSign_precond a b) : Prop := sorry

theorem hasOppositeSign_spec_satisfied (a : Int) (b : Int) (h_precond : hasOppositeSign_precond a b) :
    hasOppositeSign_postcond a b (hasOppositeSign a b h_precond) h_precond := by
  sorry

-- Test Guards

-- Test case 1
#guard hasOppositeSign_precond (-5) (10)
#guard hasOppositeSign_postcond (-5) (10) (true) (by aesop)
#guard ¬(hasOppositeSign_postcond (-5) (10) (false) (by aesop))
#guard hasOppositeSign (-5) (10) (by aesop) = (true)

-- Test case 2
#guard hasOppositeSign_precond (5) (-10)
#guard hasOppositeSign_postcond (5) (-10) (true) (by aesop)
#guard ¬(hasOppositeSign_postcond (5) (-10) (false) (by aesop))
#guard hasOppositeSign (5) (-10) (by aesop) = (true)

-- Test case 3
#guard hasOppositeSign_precond (5) (10)
#guard hasOppositeSign_postcond (5) (10) (false) (by aesop)
#guard ¬(hasOppositeSign_postcond (5) (10) (true) (by aesop))
#guard hasOppositeSign (5) (10) (by aesop) = (false)

-- Test case 4
#guard hasOppositeSign_precond (-5) (-10)
#guard hasOppositeSign_postcond (-5) (-10) (false) (by aesop)
#guard ¬(hasOppositeSign_postcond (-5) (-10) (true) (by aesop))
#guard hasOppositeSign (-5) (-10) (by aesop) = (false)

-- Test case 5
#guard hasOppositeSign_precond (0) (10)
#guard hasOppositeSign_postcond (0) (10) (false) (by aesop)
#guard ¬(hasOppositeSign_postcond (0) (10) (true) (by aesop))
#guard hasOppositeSign (0) (10) (by aesop) = (false)

-- Test case 6
#guard hasOppositeSign_precond (10) (0)
#guard hasOppositeSign_postcond (10) (0) (false) (by aesop)
#guard ¬(hasOppositeSign_postcond (10) (0) (true) (by aesop))
#guard hasOppositeSign (10) (0) (by aesop) = (false)

-- Test case 7
#guard hasOppositeSign_precond (0) (-10)
#guard hasOppositeSign_postcond (0) (-10) (false) (by aesop)
#guard ¬(hasOppositeSign_postcond (0) (-10) (true) (by aesop))
#guard hasOppositeSign (0) (-10) (by aesop) = (false)

-- Test case 8
#guard hasOppositeSign_precond (-10) (0)
#guard hasOppositeSign_postcond (-10) (0) (false) (by aesop)
#guard ¬(hasOppositeSign_postcond (-10) (0) (true) (by aesop))
#guard hasOppositeSign (-10) (0) (by aesop) = (false)

-- Test case 9
#guard hasOppositeSign_precond (0) (0)
#guard hasOppositeSign_postcond (0) (0) (false) (by aesop)
#guard ¬(hasOppositeSign_postcond (0) (0) (true) (by aesop))
#guard hasOppositeSign (0) (0) (by aesop) = (false)

-- Test case 10
#guard hasOppositeSign_precond (-1) (1)
#guard hasOppositeSign_postcond (-1) (1) (true) (by aesop)
#guard ¬(hasOppositeSign_postcond (-1) (1) (false) (by aesop))
#guard hasOppositeSign (-1) (1) (by aesop) = (true)

-- Test case 11
#guard hasOppositeSign_precond (1) (-1)
#guard hasOppositeSign_postcond (1) (-1) (true) (by aesop)
#guard ¬(hasOppositeSign_postcond (1) (-1) (false) (by aesop))
#guard hasOppositeSign (1) (-1) (by aesop) = (true)
