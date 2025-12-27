import Aesop

/-
-----Description----- 
This task requires writing a Lean 4 method that computes the element-wise
modulo between two arrays of integers. The method should produce a new array
where each element is the remainder after dividing the corresponding element
from the first array by the element from the second array.

-----Input----- 
The input consists of:
a: An array of integers.
b: An array of integers.

-----Output----- 
The output is an array of integers:
Returns a new array in which each element is the result of taking the modulo of
the corresponding elements from the two input arrays.

-----Note----- 
Preconditions:
- Both arrays must be non-null.
- Both arrays must have the same length.
- All elements in the second array should be non-zero.

Postconditions:
- The length of the resulting array is the same as the length of the input
arrays.
- Each element in the resulting array is the modulo of the corresponding
elements in the input arrays.
-/

@[reducible, simp]
def elementWiseModulo_precond (a : Array Int) (b : Array Int) : Prop := sorry

def elementWiseModulo (a : Array Int) (b : Array Int) (h_precond : elementWiseModulo_precond a b) : Array Int := sorry

@[reducible, simp]
def elementWiseModulo_postcond (a : Array Int) (b : Array Int) (result : Array Int) (h_precond : elementWiseModulo_precond a b) : Prop := sorry

theorem elementWiseModulo_spec_satisfied (a : Array Int) (b : Array Int) (h_precond : elementWiseModulo_precond a b) :
    elementWiseModulo_postcond a b (elementWiseModulo a b h_precond) h_precond := by
  sorry

-- Test Guards

-- Rejected inputs
#guard ¬(elementWiseModulo_precond (#[1]) (#[4, 0]))

-- Test case 1
#guard elementWiseModulo_precond (#[10, 20, 30]) (#[3, 7, 5])
#guard elementWiseModulo_postcond (#[10, 20, 30]) (#[3, 7, 5]) (#[1, 6, 0]) (by aesop)
#guard ¬(elementWiseModulo_postcond (#[10, 20, 30]) (#[3, 7, 5]) (#[1, 0, 0]) (by aesop))
#guard ¬(elementWiseModulo_postcond (#[10, 20, 30]) (#[3, 7, 5]) (#[0, 6, 0]) (by aesop))
#guard elementWiseModulo (#[10, 20, 30]) (#[3, 7, 5]) (by aesop) = (#[1, 6, 0])

-- Test case 2
#guard elementWiseModulo_precond (#[100, 200, 300, 400]) (#[10, 20, 30, 50])
#guard elementWiseModulo_postcond (#[100, 200, 300, 400]) (#[10, 20, 30, 50]) (#[0, 0, 0, 0]) (by aesop)
#guard ¬(elementWiseModulo_postcond (#[100, 200, 300, 400]) (#[10, 20, 30, 50]) (#[0, 0, 0, 1]) (by aesop))
#guard ¬(elementWiseModulo_postcond (#[100, 200, 300, 400]) (#[10, 20, 30, 50]) (#[1, 0, 0, 0]) (by aesop))
#guard elementWiseModulo (#[100, 200, 300, 400]) (#[10, 20, 30, 50]) (by aesop) = (#[0, 0, 0, 0])

-- Test case 3
#guard elementWiseModulo_precond (#[-10, -20, 30]) (#[3, -7, 5])
#guard elementWiseModulo_postcond (#[-10, -20, 30]) (#[3, -7, 5]) (#[2, 1, 0]) (by aesop)
#guard ¬(elementWiseModulo_postcond (#[-10, -20, 30]) (#[3, -7, 5]) (#[-1, -5, 0]) (by aesop))
#guard ¬(elementWiseModulo_postcond (#[-10, -20, 30]) (#[3, -7, 5]) (#[-1, -6, 1]) (by aesop))
#guard ¬(elementWiseModulo_postcond (#[-10, -20, 30]) (#[3, -7, 5]) (#[0, -6, 0]) (by aesop))
#guard elementWiseModulo (#[-10, -20, 30]) (#[3, -7, 5]) (by aesop) = (#[2, 1, 0])
