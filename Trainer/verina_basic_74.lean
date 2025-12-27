import Aesop

/-
-----Description-----  
This task involves identifying the maximum value in a non-empty array of
integers. The objective is to determine which element in the array is greater
than or equal to every other element, ensuring that the selected value is one of
the elements in the array.

-----Input-----  
The input consists of:  
• a: An array of integers. It is assumed that the array is non-empty (i.e., its
size is at least 1).

-----Output-----  
The output is an integer that represents the maximum element in the array. This
value is guaranteed to satisfy the following:
• It is greater than or equal to every element in the array.  
• It is exactly equal to one of the elements in the array.

-----Note-----  
It is assumed that the provided array is non-empty. In cases where the array is
empty, the function's behavior is not defined.
-/

@[reducible, simp]
def maxArray_precond (a : Array Int) : Prop := sorry

def maxArray (a : Array Int) (h_precond : maxArray_precond a) : Int := sorry

@[reducible, simp]
def maxArray_postcond (a : Array Int) (result : Int) (h_precond : maxArray_precond a) : Prop := sorry

theorem maxArray_spec_satisfied (a : Array Int) (h_precond : maxArray_precond a) :
    maxArray_postcond a (maxArray a h_precond) h_precond := by
  sorry

-- Test Guards

-- Rejected inputs
#guard ¬(maxArray_precond (#[]))

-- Test case 1
#guard maxArray_precond (#[1, 2, 3, 4, 5])
#guard maxArray_postcond (#[1, 2, 3, 4, 5]) (5) (by aesop)
#guard ¬(maxArray_postcond (#[1, 2, 3, 4, 5]) (4) (by aesop))
#guard ¬(maxArray_postcond (#[1, 2, 3, 4, 5]) (3) (by aesop))
#guard maxArray (#[1, 2, 3, 4, 5]) (by aesop) = (5)

-- Test case 2
#guard maxArray_precond (#[5, 3, 4, 1, 2])
#guard maxArray_postcond (#[5, 3, 4, 1, 2]) (5) (by aesop)
#guard ¬(maxArray_postcond (#[5, 3, 4, 1, 2]) (4) (by aesop))
#guard ¬(maxArray_postcond (#[5, 3, 4, 1, 2]) (3) (by aesop))
#guard ¬(maxArray_postcond (#[5, 3, 4, 1, 2]) (2) (by aesop))
#guard maxArray (#[5, 3, 4, 1, 2]) (by aesop) = (5)

-- Test case 3
#guard maxArray_precond (#[7])
#guard maxArray_postcond (#[7]) (7) (by aesop)
#guard ¬(maxArray_postcond (#[7]) (6) (by aesop))
#guard ¬(maxArray_postcond (#[7]) (8) (by aesop))
#guard maxArray (#[7]) (by aesop) = (7)

-- Test case 4
#guard maxArray_precond (#[-1, -5, -3, -4])
#guard maxArray_postcond (#[-1, -5, -3, -4]) (-1) (by aesop)
#guard ¬(maxArray_postcond (#[-1, -5, -3, -4]) (-3) (by aesop))
#guard ¬(maxArray_postcond (#[-1, -5, -3, -4]) (-4) (by aesop))
#guard maxArray (#[-1, -5, -3, -4]) (by aesop) = (-1)

-- Test case 5
#guard maxArray_precond (#[-10, -20, -30, -5, -15])
#guard maxArray_postcond (#[-10, -20, -30, -5, -15]) (-5) (by aesop)
#guard ¬(maxArray_postcond (#[-10, -20, -30, -5, -15]) (-10) (by aesop))
#guard ¬(maxArray_postcond (#[-10, -20, -30, -5, -15]) (-15) (by aesop))
#guard ¬(maxArray_postcond (#[-10, -20, -30, -5, -15]) (-20) (by aesop))
#guard maxArray (#[-10, -20, -30, -5, -15]) (by aesop) = (-5)
