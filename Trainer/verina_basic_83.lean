import Aesop

/-
-----Description-----  
This task involves concatenating two arrays of integers by appending the second
array to the end of the first array. The goal is to produce a new array that
sequentially contains all elements from the first array followed by all elements
from the second array.

-----Input-----  
The input consists of two parameters:  
• a: An Array of integers representing the first part of the concatenated
array.
• b: An Array of integers representing the second part of the concatenated
array.

-----Output-----  
The output is an Array of integers that satisfies the following:  
• The length of the output array is equal to the sum of the lengths of arrays a
and b.
• The first part of the output array (indices 0 to a.size - 1) is identical to
array a.
• The remaining part of the output array (indices a.size to a.size + b.size -
1) is identical to array b.

-----Note-----  
No additional preconditions are required since the function uses the sizes of
the input arrays to build the resulting array.
-/

@[reducible, simp]
def concat_precond (a : Array Int) (b : Array Int) : Prop := sorry

def concat (a : Array Int) (b : Array Int) (h_precond : concat_precond a b) : Array Int := sorry

@[reducible, simp]
def concat_postcond (a : Array Int) (b : Array Int) (result : Array Int) (h_precond : concat_precond a b) : Prop := sorry

theorem concat_spec_satisfied (a : Array Int) (b : Array Int) (h_precond : concat_precond a b) :
    concat_postcond a b (concat a b h_precond) h_precond := by
  sorry

-- Test Guards

-- Test case 1
#guard concat_precond (#[1, 2, 3]) (#[4, 5])
#guard concat_postcond (#[1, 2, 3]) (#[4, 5]) (#[1, 2, 3, 4, 5]) (by aesop)
#guard ¬(concat_postcond (#[1, 2, 3]) (#[4, 5]) (#[1, 2, 3, 5, 4]) (by aesop))
#guard ¬(concat_postcond (#[1, 2, 3]) (#[4, 5]) (#[4, 5, 1, 2, 3]) (by aesop))
#guard ¬(concat_postcond (#[1, 2, 3]) (#[4, 5]) (#[1, 2, 4, 3, 5]) (by aesop))
#guard concat (#[1, 2, 3]) (#[4, 5]) (by aesop) = (#[1, 2, 3, 4, 5])

-- Test case 2
#guard concat_precond (#[]) (#[])
#guard concat_postcond (#[]) (#[]) (#[]) (by aesop)
#guard ¬(concat_postcond (#[]) (#[]) (#[1]) (by aesop))
#guard ¬(concat_postcond (#[]) (#[]) (#[1, 2]) (by aesop))
#guard concat (#[]) (#[]) (by aesop) = (#[])

-- Test case 3
#guard concat_precond (#[10]) (#[20, 30, 40])
#guard concat_postcond (#[10]) (#[20, 30, 40]) (#[10, 20, 30, 40]) (by aesop)
#guard ¬(concat_postcond (#[10]) (#[20, 30, 40]) (#[10, 20, 30]) (by aesop))
#guard ¬(concat_postcond (#[10]) (#[20, 30, 40]) (#[20, 30, 40, 10]) (by aesop))
#guard concat (#[10]) (#[20, 30, 40]) (by aesop) = (#[10, 20, 30, 40])

-- Test case 4
#guard concat_precond (#[-1, -2]) (#[0])
#guard concat_postcond (#[-1, -2]) (#[0]) (#[-1, -2, 0]) (by aesop)
#guard ¬(concat_postcond (#[-1, -2]) (#[0]) (#[-1, 0, -2]) (by aesop))
#guard ¬(concat_postcond (#[-1, -2]) (#[0]) (#[0, -1, -2]) (by aesop))
#guard concat (#[-1, -2]) (#[0]) (by aesop) = (#[-1, -2, 0])

-- Test case 5
#guard concat_precond (#[7, 8, 9]) (#[])
#guard concat_postcond (#[7, 8, 9]) (#[]) (#[7, 8, 9]) (by aesop)
#guard ¬(concat_postcond (#[7, 8, 9]) (#[]) (#[7, 8]) (by aesop))
#guard ¬(concat_postcond (#[7, 8, 9]) (#[]) (#[8, 9]) (by aesop))
#guard ¬(concat_postcond (#[7, 8, 9]) (#[]) (#[]) (by aesop))
#guard concat (#[7, 8, 9]) (#[]) (by aesop) = (#[7, 8, 9])
