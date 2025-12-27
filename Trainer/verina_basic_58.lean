import Aesop

/-
-----Description-----  
This task involves transforming an array of integers by doubling each element.

-----Input-----  
The input consists of:  
• s: An array of integers.

-----Output-----  
The output is an array of integers where for each valid index i, the element at
position i is equal to twice the corresponding element in the input array.

-----Note-----  
The implementation makes use of a recursive helper function to update the array
in place. It is assumed that the input array is valid and that the doubling
operation does not lead to any overflow issues.
-/

@[reducible, simp]
def double_array_elements_precond (s : Array Int) : Prop := sorry

def double_array_elements (s : Array Int) (h_precond : double_array_elements_precond s) : Array Int := sorry

@[reducible, simp]
def double_array_elements_postcond (s : Array Int) (result : Array Int) (h_precond : double_array_elements_precond s) : Prop := sorry

theorem double_array_elements_spec_satisfied (s : Array Int) (h_precond : double_array_elements_precond s) :
    double_array_elements_postcond s (double_array_elements s h_precond) h_precond := by
  sorry

-- Test Guards

-- Test case 1
#guard double_array_elements_precond (#[])
#guard double_array_elements_postcond (#[]) (#[]) (by aesop)
#guard ¬(double_array_elements_postcond (#[]) (#[1]) (by aesop))
#guard ¬(double_array_elements_postcond (#[]) (#[0]) (by aesop))
#guard ¬(double_array_elements_postcond (#[]) (#[-1]) (by aesop))
#guard double_array_elements (#[]) (by aesop) = (#[])

-- Test case 2
#guard double_array_elements_precond (#[1, 2, 3, 4, 5])
#guard double_array_elements_postcond (#[1, 2, 3, 4, 5]) (#[2, 4, 6, 8, 10]) (by aesop)
#guard ¬(double_array_elements_postcond (#[1, 2, 3, 4, 5]) (#[1, 2, 3, 4, 5]) (by aesop))
#guard ¬(double_array_elements_postcond (#[1, 2, 3, 4, 5]) (#[2, 4, 6, 8, 9]) (by aesop))
#guard ¬(double_array_elements_postcond (#[1, 2, 3, 4, 5]) (#[0, 4, 6, 8, 10]) (by aesop))
#guard double_array_elements (#[1, 2, 3, 4, 5]) (by aesop) = (#[2, 4, 6, 8, 10])

-- Test case 3
#guard double_array_elements_precond (#[0, -1, 5])
#guard double_array_elements_postcond (#[0, -1, 5]) (#[0, -2, 10]) (by aesop)
#guard ¬(double_array_elements_postcond (#[0, -1, 5]) (#[0, -1, 5]) (by aesop))
#guard ¬(double_array_elements_postcond (#[0, -1, 5]) (#[1, -2, 10]) (by aesop))
#guard ¬(double_array_elements_postcond (#[0, -1, 5]) (#[0, 0, 10]) (by aesop))
#guard double_array_elements (#[0, -1, 5]) (by aesop) = (#[0, -2, 10])

-- Test case 4
#guard double_array_elements_precond (#[100])
#guard double_array_elements_postcond (#[100]) (#[200]) (by aesop)
#guard ¬(double_array_elements_postcond (#[100]) (#[100]) (by aesop))
#guard ¬(double_array_elements_postcond (#[100]) (#[0]) (by aesop))
#guard ¬(double_array_elements_postcond (#[100]) (#[201]) (by aesop))
#guard double_array_elements (#[100]) (by aesop) = (#[200])

-- Test case 5
#guard double_array_elements_precond (#[-3, -4])
#guard double_array_elements_postcond (#[-3, -4]) (#[-6, -8]) (by aesop)
#guard ¬(double_array_elements_postcond (#[-3, -4]) (#[3, -4]) (by aesop))
#guard ¬(double_array_elements_postcond (#[-3, -4]) (#[-6, -7]) (by aesop))
#guard ¬(double_array_elements_postcond (#[-3, -4]) (#[-6, -9]) (by aesop))
#guard double_array_elements (#[-3, -4]) (by aesop) = (#[-6, -8])
