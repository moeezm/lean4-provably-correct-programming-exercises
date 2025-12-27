import Aesop

/-
-----Description-----  
This task requires writing a Lean 4 method that swaps the first and last
elements of an array of integers. The method should produce a new array where
the first element of the output is the last element of the input, the last
element of the output is the first element of the input, and all other elements
remain in their original positions.

-----Input-----  
The input consists of:  
a: An array of integers (assumed to be non-empty).

-----Output-----  
The output is an array of integers:  
Returns a new array where:  
- The former last element becomes the first element.  
- The former first element becomes the last element.  
- All other elements remain unchanged.
-/

@[reducible, simp]
def swapFirstAndLast_precond (a : Array Int) : Prop := sorry

def swapFirstAndLast (a : Array Int) (h_precond : swapFirstAndLast_precond a) : Array Int := sorry

@[reducible, simp]
def swapFirstAndLast_postcond (a : Array Int) (result : Array Int) (h_precond : swapFirstAndLast_precond a) : Prop := sorry

theorem swapFirstAndLast_spec_satisfied (a : Array Int) (h_precond : swapFirstAndLast_precond a) :
    swapFirstAndLast_postcond a (swapFirstAndLast a h_precond) h_precond := by
  sorry

-- Test Guards

-- Rejected inputs
#guard ¬(swapFirstAndLast_precond (#[]))

-- Test case 1
#guard swapFirstAndLast_precond (#[1, 2, 3, 4, 5])
#guard swapFirstAndLast_postcond (#[1, 2, 3, 4, 5]) (#[5, 2, 3, 4, 1]) (by aesop)
#guard ¬(swapFirstAndLast_postcond (#[1, 2, 3, 4, 5]) (#[1, 2, 3, 4, 5]) (by aesop))
#guard ¬(swapFirstAndLast_postcond (#[1, 2, 3, 4, 5]) (#[5, 4, 3, 2, 1]) (by aesop))
#guard ¬(swapFirstAndLast_postcond (#[1, 2, 3, 4, 5]) (#[2, 3, 4, 5, 1]) (by aesop))
#guard swapFirstAndLast (#[1, 2, 3, 4, 5]) (by aesop) = (#[5, 2, 3, 4, 1])

-- Test case 2
#guard swapFirstAndLast_precond (#[10])
#guard swapFirstAndLast_postcond (#[10]) (#[10]) (by aesop)
#guard ¬(swapFirstAndLast_postcond (#[10]) (#[0]) (by aesop))
#guard ¬(swapFirstAndLast_postcond (#[10]) (#[5]) (by aesop))
#guard ¬(swapFirstAndLast_postcond (#[10]) (#[11]) (by aesop))
#guard swapFirstAndLast (#[10]) (by aesop) = (#[10])

-- Test case 3
#guard swapFirstAndLast_precond (#[1, 2])
#guard swapFirstAndLast_postcond (#[1, 2]) (#[2, 1]) (by aesop)
#guard ¬(swapFirstAndLast_postcond (#[1, 2]) (#[1, 2]) (by aesop))
#guard ¬(swapFirstAndLast_postcond (#[1, 2]) (#[2, 2]) (by aesop))
#guard ¬(swapFirstAndLast_postcond (#[1, 2]) (#[1, 1]) (by aesop))
#guard swapFirstAndLast (#[1, 2]) (by aesop) = (#[2, 1])

-- Test case 4
#guard swapFirstAndLast_precond (#[1, 2, 3])
#guard swapFirstAndLast_postcond (#[1, 2, 3]) (#[3, 2, 1]) (by aesop)
#guard ¬(swapFirstAndLast_postcond (#[1, 2, 3]) (#[1, 2, 3]) (by aesop))
#guard ¬(swapFirstAndLast_postcond (#[1, 2, 3]) (#[3, 1, 2]) (by aesop))
#guard ¬(swapFirstAndLast_postcond (#[1, 2, 3]) (#[2, 1, 3]) (by aesop))
#guard swapFirstAndLast (#[1, 2, 3]) (by aesop) = (#[3, 2, 1])
