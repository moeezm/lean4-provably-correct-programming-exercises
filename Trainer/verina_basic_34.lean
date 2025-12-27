import Aesop

/-
-----Description----- 
This task requires writing a Lean 4 method that extracts even numbers from an
array of integers. The method should return a new array containing only the even
numbers found in the input array, while preserving the order in which they
appear.

-----Input-----
The input consists of:
arr: An array of integers.

-----Output-----
The output is an array of integers:
Returns an array containing all the even numbers from the input array.
Specifically:
- Every element in the output array is an even integer.
- All even integers present in the input array are included in the output array.
- The relative order of the even integers is preserved as in the input array.

-----Note-----
There are no preconditions for this task; the method will work with any array,
including empty arrays (which are not null).
-/

@[reducible, simp]
def findEvenNumbers_precond (arr : Array Int) : Prop := sorry

def findEvenNumbers (arr : Array Int) (h_precond : findEvenNumbers_precond arr) : Array Int := sorry

@[reducible, simp]
def findEvenNumbers_postcond (arr : Array Int) (result : Array Int) (h_precond : findEvenNumbers_precond arr) : Prop := sorry

theorem findEvenNumbers_spec_satisfied (arr : Array Int) (h_precond : findEvenNumbers_precond arr) :
    findEvenNumbers_postcond arr (findEvenNumbers arr h_precond) h_precond := by
  sorry

-- Test Guards

-- Test case 1
#guard findEvenNumbers_precond (#[1, 2, 3, 4, 5, 6])
#guard findEvenNumbers_postcond (#[1, 2, 3, 4, 5, 6]) (#[2, 4, 6]) (by aesop)
#guard ¬(findEvenNumbers_postcond (#[1, 2, 3, 4, 5, 6]) (#[1, 2, 3]) (by aesop))
#guard ¬(findEvenNumbers_postcond (#[1, 2, 3, 4, 5, 6]) (#[2, 3, 4, 6]) (by aesop))
#guard findEvenNumbers (#[1, 2, 3, 4, 5, 6]) (by aesop) = (#[2, 4, 6])

-- Test case 2
#guard findEvenNumbers_precond (#[7, 8, 10, 13, 14])
#guard findEvenNumbers_postcond (#[7, 8, 10, 13, 14]) (#[8, 10, 14]) (by aesop)
#guard ¬(findEvenNumbers_postcond (#[7, 8, 10, 13, 14]) (#[7, 8, 10]) (by aesop))
#guard ¬(findEvenNumbers_postcond (#[7, 8, 10, 13, 14]) (#[8, 14]) (by aesop))
#guard findEvenNumbers (#[7, 8, 10, 13, 14]) (by aesop) = (#[8, 10, 14])

-- Test case 3
#guard findEvenNumbers_precond (#[1, 3, 5, 7])
#guard findEvenNumbers_postcond (#[1, 3, 5, 7]) (#[]) (by aesop)
#guard ¬(findEvenNumbers_postcond (#[1, 3, 5, 7]) (#[1]) (by aesop))
#guard ¬(findEvenNumbers_postcond (#[1, 3, 5, 7]) (#[1, 3]) (by aesop))
#guard findEvenNumbers (#[1, 3, 5, 7]) (by aesop) = (#[])

-- Test case 4
#guard findEvenNumbers_precond (#[])
#guard findEvenNumbers_postcond (#[]) (#[]) (by aesop)
#guard ¬(findEvenNumbers_postcond (#[]) (#[0]) (by aesop))
#guard ¬(findEvenNumbers_postcond (#[]) (#[1]) (by aesop))
#guard findEvenNumbers (#[]) (by aesop) = (#[])

-- Test case 5
#guard findEvenNumbers_precond (#[0, -2, -3, -4, 5])
#guard findEvenNumbers_postcond (#[0, -2, -3, -4, 5]) (#[0, -2, -4]) (by aesop)
#guard ¬(findEvenNumbers_postcond (#[0, -2, -3, -4, 5]) (#[0, -3, -4]) (by aesop))
#guard ¬(findEvenNumbers_postcond (#[0, -2, -3, -4, 5]) (#[-2, -4]) (by aesop))
#guard findEvenNumbers (#[0, -2, -3, -4, 5]) (by aesop) = (#[0, -2, -4])
