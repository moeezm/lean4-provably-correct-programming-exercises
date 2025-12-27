import Aesop

/-
-----Description-----  
This task requires writing a Lean 4 method that computes the product of the
first even and the first odd number encountered in a list of integers. The
method should search the list for the earliest even number and the earliest odd
number, then return the product of these two numbers.

-----Input-----  
The input consists of:  
lst: A list of integers.

-----Output-----  
The output is an integer:  
Returns the product resulting from multiplying the first even number and the
first odd number found in the list.

-----Note-----  
The input list is assumed to contain at least one even number and one odd
number.
-/

@[reducible, simp]
def findProduct_precond (lst : List Int) : Prop := sorry

def findProduct (lst : List Int) (h_precond : findProduct_precond lst) : Int := sorry

@[reducible, simp]
def findProduct_postcond (lst : List Int) (result : Int) (h_precond : findProduct_precond lst) : Prop := sorry

theorem findProduct_spec_satisfied (lst : List Int) (h_precond : findProduct_precond lst) :
    findProduct_postcond lst (findProduct lst h_precond) h_precond := by
  sorry

-- Test Guards

-- Rejected inputs
#guard ¬(findProduct_precond ([2]))

-- Test case 1
#guard findProduct_precond ([2, 3, 4, 5])
#guard findProduct_postcond ([2, 3, 4, 5]) (6) (by aesop)
#guard ¬(findProduct_postcond ([2, 3, 4, 5]) (8) (by aesop))
#guard ¬(findProduct_postcond ([2, 3, 4, 5]) (0) (by aesop))
#guard ¬(findProduct_postcond ([2, 3, 4, 5]) (10) (by aesop))
#guard findProduct ([2, 3, 4, 5]) (by aesop) = (6)

-- Test case 2
#guard findProduct_precond ([2, 4, 3, 6])
#guard findProduct_postcond ([2, 4, 3, 6]) (6) (by aesop)
#guard ¬(findProduct_postcond ([2, 4, 3, 6]) (8) (by aesop))
#guard ¬(findProduct_postcond ([2, 4, 3, 6]) (0) (by aesop))
#guard ¬(findProduct_postcond ([2, 4, 3, 6]) (24) (by aesop))
#guard findProduct ([2, 4, 3, 6]) (by aesop) = (6)

-- Test case 3
#guard findProduct_precond ([1, 2, 5, 4])
#guard findProduct_postcond ([1, 2, 5, 4]) (2) (by aesop)
#guard ¬(findProduct_postcond ([1, 2, 5, 4]) (5) (by aesop))
#guard ¬(findProduct_postcond ([1, 2, 5, 4]) (0) (by aesop))
#guard ¬(findProduct_postcond ([1, 2, 5, 4]) (10) (by aesop))
#guard findProduct ([1, 2, 5, 4]) (by aesop) = (2)
