import Aesop

/-
-----Description----- 
This task requires writing a Lean 4 method that calculates the product of all
distinct integers in an array. The method should consider each unique integer
only once when computing the product and return the resulting value. If the
array is empty, the method should return 1.

-----Input-----
The input consists of:
arr: An array of integers.

-----Output-----
The output is an integer:
Returns the product of all unique integers from the input array.

-----Note-----
The order in which the unique integers are multiplied does not affect the final
product.
-/

@[reducible, simp]
def uniqueProduct_precond (arr : Array Int) : Prop := sorry

def uniqueProduct (arr : Array Int) (h_precond : uniqueProduct_precond arr) : Int := sorry

@[reducible, simp]
def uniqueProduct_postcond (arr : Array Int) (result : Int) (h_precond : uniqueProduct_precond arr) : Prop := sorry

theorem uniqueProduct_spec_satisfied (arr : Array Int) (h_precond : uniqueProduct_precond arr) :
    uniqueProduct_postcond arr (uniqueProduct arr h_precond) h_precond := by
  sorry

-- Test Guards

-- Test case 1
#guard uniqueProduct_precond (#[2, 3, 2, 4])
#guard uniqueProduct_postcond (#[2, 3, 2, 4]) (24) (by aesop)
#guard ¬(uniqueProduct_postcond (#[2, 3, 2, 4]) (12) (by aesop))
#guard ¬(uniqueProduct_postcond (#[2, 3, 2, 4]) (30) (by aesop))
#guard ¬(uniqueProduct_postcond (#[2, 3, 2, 4]) (0) (by aesop))
#guard uniqueProduct (#[2, 3, 2, 4]) (by aesop) = (24)

-- Test case 2
#guard uniqueProduct_precond (#[5, 5, 5, 5])
#guard uniqueProduct_postcond (#[5, 5, 5, 5]) (5) (by aesop)
#guard ¬(uniqueProduct_postcond (#[5, 5, 5, 5]) (25) (by aesop))
#guard ¬(uniqueProduct_postcond (#[5, 5, 5, 5]) (0) (by aesop))
#guard ¬(uniqueProduct_postcond (#[5, 5, 5, 5]) (10) (by aesop))
#guard uniqueProduct (#[5, 5, 5, 5]) (by aesop) = (5)

-- Test case 3
#guard uniqueProduct_precond (#[])
#guard uniqueProduct_postcond (#[]) (1) (by aesop)
#guard ¬(uniqueProduct_postcond (#[]) (0) (by aesop))
#guard ¬(uniqueProduct_postcond (#[]) (-1) (by aesop))
#guard ¬(uniqueProduct_postcond (#[]) (2) (by aesop))
#guard uniqueProduct (#[]) (by aesop) = (1)

-- Test case 4
#guard uniqueProduct_precond (#[1, 2, 3])
#guard uniqueProduct_postcond (#[1, 2, 3]) (6) (by aesop)
#guard ¬(uniqueProduct_postcond (#[1, 2, 3]) (5) (by aesop))
#guard ¬(uniqueProduct_postcond (#[1, 2, 3]) (7) (by aesop))
#guard ¬(uniqueProduct_postcond (#[1, 2, 3]) (2) (by aesop))
#guard uniqueProduct (#[1, 2, 3]) (by aesop) = (6)

-- Test case 5
#guard uniqueProduct_precond (#[0, 2, 3])
#guard uniqueProduct_postcond (#[0, 2, 3]) (0) (by aesop)
#guard ¬(uniqueProduct_postcond (#[0, 2, 3]) (1) (by aesop))
#guard ¬(uniqueProduct_postcond (#[0, 2, 3]) (-1) (by aesop))
#guard ¬(uniqueProduct_postcond (#[0, 2, 3]) (10) (by aesop))
#guard uniqueProduct (#[0, 2, 3]) (by aesop) = (0)

-- Test case 6
#guard uniqueProduct_precond (#[-1, -2, -1, -3])
#guard uniqueProduct_postcond (#[-1, -2, -1, -3]) (-6) (by aesop)
#guard ¬(uniqueProduct_postcond (#[-1, -2, -1, -3]) (-1) (by aesop))
#guard ¬(uniqueProduct_postcond (#[-1, -2, -1, -3]) (6) (by aesop))
#guard ¬(uniqueProduct_postcond (#[-1, -2, -1, -3]) (-3) (by aesop))
#guard uniqueProduct (#[-1, -2, -1, -3]) (by aesop) = (-6)

-- Test case 7
#guard uniqueProduct_precond (#[10, 10, 20, 20, 30])
#guard uniqueProduct_postcond (#[10, 10, 20, 20, 30]) (6000) (by aesop)
#guard ¬(uniqueProduct_postcond (#[10, 10, 20, 20, 30]) (600) (by aesop))
#guard ¬(uniqueProduct_postcond (#[10, 10, 20, 20, 30]) (0) (by aesop))
#guard ¬(uniqueProduct_postcond (#[10, 10, 20, 20, 30]) (5000) (by aesop))
#guard uniqueProduct (#[10, 10, 20, 20, 30]) (by aesop) = (6000)
