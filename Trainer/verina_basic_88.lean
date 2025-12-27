import Aesop

/-
-----Description-----  
This task involves converting a list of integers into an array such that the
array contains all the elements of the list in the exact same order. The
objective is to ensure that the array has the same number of elements as the
list and that each element in the array corresponds exactly to the element at
the same position in the list.

-----Input-----  
The input consists of:  
• xs: A list of integer elements.  

-----Output-----  
The output is an array of elements of type integer that:  
• Has a size equal to the length of the input list xs.  
• Contains all the elements from xs in the same order, ensuring that for every
valid index i, the array element at i is equal to the list element at i.

-----Note-----  
There are no additional preconditions; the method should work correctly for any
list of elements.
A corresponding specification is provided stating that the array’s size equals
the list’s length and that each element is preserved.
-/

@[reducible, simp]
def ToArray_precond (xs : List Int) : Prop := sorry

def ToArray (xs : List Int) (h_precond : ToArray_precond xs) : Array Int := sorry

@[reducible, simp]
def ToArray_postcond (xs : List Int) (result : Array Int) (h_precond : ToArray_precond xs) : Prop := sorry

theorem ToArray_spec_satisfied (xs : List Int) (h_precond : ToArray_precond xs) :
    ToArray_postcond xs (ToArray xs h_precond) h_precond := by
  sorry

-- Test Guards

-- Test case 1
#guard ToArray_precond ([1, 2, 3])
#guard ToArray_postcond ([1, 2, 3]) (#[1, 2, 3]) (by aesop)
#guard ¬(ToArray_postcond ([1, 2, 3]) (#[1, 2]) (by aesop))
#guard ¬(ToArray_postcond ([1, 2, 3]) (#[1, 2, 3, 4]) (by aesop))
#guard ¬(ToArray_postcond ([1, 2, 3]) (#[3, 2, 1]) (by aesop))
#guard ToArray ([1, 2, 3]) (by aesop) = (#[1, 2, 3])

-- Test case 2
#guard ToArray_precond ([])
#guard ToArray_postcond ([]) (#[]) (by aesop)
#guard ¬(ToArray_postcond ([]) (#[0]) (by aesop))
#guard ¬(ToArray_postcond ([]) (#[1]) (by aesop))
#guard ¬(ToArray_postcond ([]) (#[1, 0]) (by aesop))
#guard ToArray ([]) (by aesop) = (#[])

-- Test case 3
#guard ToArray_precond ([0, -1, 5])
#guard ToArray_postcond ([0, -1, 5]) (#[0, -1, 5]) (by aesop)
#guard ¬(ToArray_postcond ([0, -1, 5]) (#[-1, 0, 5]) (by aesop))
#guard ¬(ToArray_postcond ([0, -1, 5]) (#[0, 5]) (by aesop))
#guard ¬(ToArray_postcond ([0, -1, 5]) (#[0, -1, 4]) (by aesop))
#guard ToArray ([0, -1, 5]) (by aesop) = (#[0, -1, 5])

-- Test case 4
#guard ToArray_precond ([7])
#guard ToArray_postcond ([7]) (#[7]) (by aesop)
#guard ¬(ToArray_postcond ([7]) (#[]) (by aesop))
#guard ¬(ToArray_postcond ([7]) (#[0, 7]) (by aesop))
#guard ¬(ToArray_postcond ([7]) (#[8]) (by aesop))
#guard ToArray ([7]) (by aesop) = (#[7])

-- Test case 5
#guard ToArray_precond ([100, 200, 300, 400])
#guard ToArray_postcond ([100, 200, 300, 400]) (#[100, 200, 300, 400]) (by aesop)
#guard ¬(ToArray_postcond ([100, 200, 300, 400]) (#[100, 200, 300]) (by aesop))
#guard ¬(ToArray_postcond ([100, 200, 300, 400]) (#[100, 300, 200, 400]) (by aesop))
#guard ¬(ToArray_postcond ([100, 200, 300, 400]) (#[400, 300, 200, 100]) (by aesop))
#guard ToArray ([100, 200, 300, 400]) (by aesop) = (#[100, 200, 300, 400])
