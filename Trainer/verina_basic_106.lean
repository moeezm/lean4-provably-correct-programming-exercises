import Aesop

/-
-----Description-----  
The task is to compute the element-wise sum of two integer arrays. The result
should be a new array where each element is the sum of the corresponding
elements from the two input arrays. The problem assumes that both arrays have
the same length.

-----Input-----  
The input consists of two parameters:  
• a: An array of integers.  
• b: An array of integers.  
Note: Both arrays must have the same length.

-----Output-----  
The output is an array of integers that:  
• Has the same size as the input arrays.  
• Contains elements where each element at index i is computed as a[i]! + b[i]!
from the input arrays.

-----Note-----  
It is assumed that the two input arrays have equal lengths.
-/

@[reducible, simp]
def arraySum_precond (a : Array Int) (b : Array Int) : Prop := sorry

def arraySum (a : Array Int) (b : Array Int) (h_precond : arraySum_precond a b) : Array Int := sorry

@[reducible, simp]
def arraySum_postcond (a : Array Int) (b : Array Int) (result : Array Int) (h_precond : arraySum_precond a b) : Prop := sorry

theorem arraySum_spec_satisfied (a : Array Int) (b : Array Int) (h_precond : arraySum_precond a b) :
    arraySum_postcond a b (arraySum a b h_precond) h_precond := by
  sorry

-- Test Guards

-- Rejected inputs
#guard ¬(arraySum_precond (#[1, 2, 3, 4]) (#[5, 6, 7]))

-- Test case 1
#guard arraySum_precond (#[1, 2, 3]) (#[4, 5, 6])
#guard arraySum_postcond (#[1, 2, 3]) (#[4, 5, 6]) (#[5, 7, 9]) (by aesop)
#guard ¬(arraySum_postcond (#[1, 2, 3]) (#[4, 5, 6]) (#[5, 6, 9]) (by aesop))
#guard ¬(arraySum_postcond (#[1, 2, 3]) (#[4, 5, 6]) (#[4, 7, 9]) (by aesop))
#guard arraySum (#[1, 2, 3]) (#[4, 5, 6]) (by aesop) = (#[5, 7, 9])

-- Test case 2
#guard arraySum_precond (#[0, 0, 0]) (#[0, 0, 0])
#guard arraySum_postcond (#[0, 0, 0]) (#[0, 0, 0]) (#[0, 0, 0]) (by aesop)
#guard ¬(arraySum_postcond (#[0, 0, 0]) (#[0, 0, 0]) (#[0, 0, 1]) (by aesop))
#guard ¬(arraySum_postcond (#[0, 0, 0]) (#[0, 0, 0]) (#[1, 0, 0]) (by aesop))
#guard arraySum (#[0, 0, 0]) (#[0, 0, 0]) (by aesop) = (#[0, 0, 0])

-- Test case 3
#guard arraySum_precond (#[-1, 2, 3]) (#[1, -2, 4])
#guard arraySum_postcond (#[-1, 2, 3]) (#[1, -2, 4]) (#[0, 0, 7]) (by aesop)
#guard ¬(arraySum_postcond (#[-1, 2, 3]) (#[1, -2, 4]) (#[0, 1, 7]) (by aesop))
#guard ¬(arraySum_postcond (#[-1, 2, 3]) (#[1, -2, 4]) (#[0, 0, 6]) (by aesop))
#guard arraySum (#[-1, 2, 3]) (#[1, -2, 4]) (by aesop) = (#[0, 0, 7])

-- Test case 4
#guard arraySum_precond (#[10]) (#[-10])
#guard arraySum_postcond (#[10]) (#[-10]) (#[0]) (by aesop)
#guard ¬(arraySum_postcond (#[10]) (#[-10]) (#[1]) (by aesop))
#guard ¬(arraySum_postcond (#[10]) (#[-10]) (#[-1]) (by aesop))
#guard arraySum (#[10]) (#[-10]) (by aesop) = (#[0])

-- Test case 5
#guard arraySum_precond (#[100, 200, 300]) (#[100, 200, 300])
#guard arraySum_postcond (#[100, 200, 300]) (#[100, 200, 300]) (#[200, 400, 600]) (by aesop)
#guard ¬(arraySum_postcond (#[100, 200, 300]) (#[100, 200, 300]) (#[200, 400, 601]) (by aesop))
#guard ¬(arraySum_postcond (#[100, 200, 300]) (#[100, 200, 300]) (#[199, 400, 600]) (by aesop))
#guard ¬(arraySum_postcond (#[100, 200, 300]) (#[100, 200, 300]) (#[200, 399, 600]) (by aesop))
#guard arraySum (#[100, 200, 300]) (#[100, 200, 300]) (by aesop) = (#[200, 400, 600])
