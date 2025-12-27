import Aesop

/-
-----Description-----
This task requires writing a Lean 4 method that finds the maximum among three
given integers. The method should return the largest value, ensuring that the
result is greater than or equal to each of the input numbers and that it is one
of the provided integers.

-----Input-----
The input consists of three integers:
a: The first integer.
b: The second integer.
c: The third integer.

-----Output-----
The output is an integer:
Returns the maximum of the three input numbers, assuring that the returned
value is greater than or equal to a, b, and c, and that it matches one of these
values.


-/

@[reducible, simp]
def maxOfThree_precond (a : Int) (b : Int) (c : Int) : Prop := sorry

def maxOfThree (a : Int) (b : Int) (c : Int) (h_precond : maxOfThree_precond a b c) : Int := sorry

@[reducible, simp]
def maxOfThree_postcond (a : Int) (b : Int) (c : Int) (result : Int) (h_precond : maxOfThree_precond a b c) : Prop := sorry

theorem maxOfThree_spec_satisfied (a : Int) (b : Int) (c : Int) (h_precond : maxOfThree_precond a b c) :
    maxOfThree_postcond a b c (maxOfThree a b c h_precond) h_precond := by
  sorry

-- Test Guards

-- Test case 1
#guard maxOfThree_precond (3) (2) (1)
#guard maxOfThree_postcond (3) (2) (1) (3) (by aesop)
#guard ¬(maxOfThree_postcond (3) (2) (1) (2) (by aesop))
#guard ¬(maxOfThree_postcond (3) (2) (1) (1) (by aesop))
#guard ¬(maxOfThree_postcond (3) (2) (1) (-1) (by aesop))
#guard maxOfThree (3) (2) (1) (by aesop) = (3)

-- Test case 2
#guard maxOfThree_precond (5) (5) (5)
#guard maxOfThree_postcond (5) (5) (5) (5) (by aesop)
#guard ¬(maxOfThree_postcond (5) (5) (5) (6) (by aesop))
#guard ¬(maxOfThree_postcond (5) (5) (5) (4) (by aesop))
#guard maxOfThree (5) (5) (5) (by aesop) = (5)

-- Test case 3
#guard maxOfThree_precond (10) (20) (15)
#guard maxOfThree_postcond (10) (20) (15) (20) (by aesop)
#guard ¬(maxOfThree_postcond (10) (20) (15) (10) (by aesop))
#guard ¬(maxOfThree_postcond (10) (20) (15) (15) (by aesop))
#guard maxOfThree (10) (20) (15) (by aesop) = (20)

-- Test case 4
#guard maxOfThree_precond (-1) (-2) (-3)
#guard maxOfThree_postcond (-1) (-2) (-3) (-1) (by aesop)
#guard ¬(maxOfThree_postcond (-1) (-2) (-3) (-2) (by aesop))
#guard ¬(maxOfThree_postcond (-1) (-2) (-3) (-3) (by aesop))
#guard maxOfThree (-1) (-2) (-3) (by aesop) = (-1)

-- Test case 5
#guard maxOfThree_precond (0) (-10) (-5)
#guard maxOfThree_postcond (0) (-10) (-5) (0) (by aesop)
#guard ¬(maxOfThree_postcond (0) (-10) (-5) (-5) (by aesop))
#guard ¬(maxOfThree_postcond (0) (-10) (-5) (-10) (by aesop))
#guard maxOfThree (0) (-10) (-5) (by aesop) = (0)
