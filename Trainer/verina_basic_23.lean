import Aesop

/-
-----Description----- 
This task requires writing a Lean 4 method that calculates the difference
between the maximum and minimum values in an array of integers. In other words,
the method should determine the highest and lowest numbers in the array and
return the result of subtracting the minimum from the maximum.

-----Input-----
The input consists of:
a: An array of integers.

-----Output-----
The output is an integer:
Returns the difference between the largest and the smallest values in the input
array.

-----Note-----
The input array is assumed to be non-empty.
-/

@[reducible, simp]
def differenceMinMax_precond (a : Array Int) : Prop := sorry

def differenceMinMax (a : Array Int) (h_precond : differenceMinMax_precond a) : Int := sorry

@[reducible, simp]
def differenceMinMax_postcond (a : Array Int) (result : Int) (h_precond : differenceMinMax_precond a) : Prop := sorry

theorem differenceMinMax_spec_satisfied (a : Array Int) (h_precond : differenceMinMax_precond a) :
    differenceMinMax_postcond a (differenceMinMax a h_precond) h_precond := by
  sorry

-- Test Guards

-- Rejected inputs
#guard ¬(differenceMinMax_precond (#[]))

-- Test case 1
#guard differenceMinMax_precond (#[3, 1, 4, 1, 5, 9, 2, 6, 5, 3, 5])
#guard differenceMinMax_postcond (#[3, 1, 4, 1, 5, 9, 2, 6, 5, 3, 5]) (8) (by aesop)
#guard ¬(differenceMinMax_postcond (#[3, 1, 4, 1, 5, 9, 2, 6, 5, 3, 5]) (7) (by aesop))
#guard ¬(differenceMinMax_postcond (#[3, 1, 4, 1, 5, 9, 2, 6, 5, 3, 5]) (9) (by aesop))
#guard ¬(differenceMinMax_postcond (#[3, 1, 4, 1, 5, 9, 2, 6, 5, 3, 5]) (10) (by aesop))
#guard differenceMinMax (#[3, 1, 4, 1, 5, 9, 2, 6, 5, 3, 5]) (by aesop) = (8)

-- Test case 2
#guard differenceMinMax_precond (#[10, 20, 30, 40, 50])
#guard differenceMinMax_postcond (#[10, 20, 30, 40, 50]) (40) (by aesop)
#guard ¬(differenceMinMax_postcond (#[10, 20, 30, 40, 50]) (30) (by aesop))
#guard ¬(differenceMinMax_postcond (#[10, 20, 30, 40, 50]) (35) (by aesop))
#guard ¬(differenceMinMax_postcond (#[10, 20, 30, 40, 50]) (45) (by aesop))
#guard differenceMinMax (#[10, 20, 30, 40, 50]) (by aesop) = (40)

-- Test case 3
#guard differenceMinMax_precond (#[-10, -20, -30, -40, -50])
#guard differenceMinMax_postcond (#[-10, -20, -30, -40, -50]) (40) (by aesop)
#guard ¬(differenceMinMax_postcond (#[-10, -20, -30, -40, -50]) (30) (by aesop))
#guard ¬(differenceMinMax_postcond (#[-10, -20, -30, -40, -50]) (41) (by aesop))
#guard ¬(differenceMinMax_postcond (#[-10, -20, -30, -40, -50]) (20) (by aesop))
#guard differenceMinMax (#[-10, -20, -30, -40, -50]) (by aesop) = (40)

-- Test case 4
#guard differenceMinMax_precond (#[7])
#guard differenceMinMax_postcond (#[7]) (0) (by aesop)
#guard ¬(differenceMinMax_postcond (#[7]) (1) (by aesop))
#guard ¬(differenceMinMax_postcond (#[7]) (-1) (by aesop))
#guard ¬(differenceMinMax_postcond (#[7]) (2) (by aesop))
#guard differenceMinMax (#[7]) (by aesop) = (0)

-- Test case 5
#guard differenceMinMax_precond (#[5, 5, 5, 5])
#guard differenceMinMax_postcond (#[5, 5, 5, 5]) (0) (by aesop)
#guard ¬(differenceMinMax_postcond (#[5, 5, 5, 5]) (1) (by aesop))
#guard ¬(differenceMinMax_postcond (#[5, 5, 5, 5]) (5) (by aesop))
#guard ¬(differenceMinMax_postcond (#[5, 5, 5, 5]) (-1) (by aesop))
#guard differenceMinMax (#[5, 5, 5, 5]) (by aesop) = (0)

-- Test case 6
#guard differenceMinMax_precond (#[1, -1, 2, -2])
#guard differenceMinMax_postcond (#[1, -1, 2, -2]) (4) (by aesop)
#guard ¬(differenceMinMax_postcond (#[1, -1, 2, -2]) (3) (by aesop))
#guard ¬(differenceMinMax_postcond (#[1, -1, 2, -2]) (0) (by aesop))
#guard ¬(differenceMinMax_postcond (#[1, -1, 2, -2]) (5) (by aesop))
#guard differenceMinMax (#[1, -1, 2, -2]) (by aesop) = (4)
