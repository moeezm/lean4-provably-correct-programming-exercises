import Aesop

/-
-----Description-----  
This problem requires sorting an array of integers into non-decreasing order,
ensuring that the output contains exactly the same elements as the input (i.e.,
it is a permutation of the original array).

-----Input-----  
The input consists of:  
• a: An array of integers (Array Int).  

-----Output-----  
The output is an array of integers that is:  
• Sorted in non-decreasing order.  
• A permutation of the input, meaning it contains exactly the same elements
(with the same multiplicities) as the original array.

-----Note-----  
It is assumed that the input array is valid and that the swap operations, along
with the helper functions, correctly implement the selection sort algorithm.
-/

@[reducible, simp]
def SelectionSort_precond (a : Array Int) : Prop := sorry

def SelectionSort (a : Array Int) (h_precond : SelectionSort_precond a) : Array Int := sorry

@[reducible, simp]
def SelectionSort_postcond (a : Array Int) (result : Array Int) (h_precond : SelectionSort_precond a) : Prop := sorry

theorem SelectionSort_spec_satisfied (a : Array Int) (h_precond : SelectionSort_precond a) :
    SelectionSort_postcond a (SelectionSort a h_precond) h_precond := by
  sorry

-- Test Guards

-- Test case 1
#guard SelectionSort_precond (#[3, 1, 2])
#guard SelectionSort_postcond (#[3, 1, 2]) (#[1, 2, 3]) (by aesop)
#guard ¬(SelectionSort_postcond (#[3, 1, 2]) (#[3, 1, 2]) (by aesop))
#guard ¬(SelectionSort_postcond (#[3, 1, 2]) (#[2, 3, 1]) (by aesop))
#guard SelectionSort (#[3, 1, 2]) (by aesop) = (#[1, 2, 3])

-- Test case 2
#guard SelectionSort_precond (#[0])
#guard SelectionSort_postcond (#[0]) (#[0]) (by aesop)
#guard ¬(SelectionSort_postcond (#[0]) (#[0, 0]) (by aesop))
#guard ¬(SelectionSort_postcond (#[0]) (#[1]) (by aesop))
#guard SelectionSort (#[0]) (by aesop) = (#[0])

-- Test case 3
#guard SelectionSort_precond (#[5, 4, 3, 2, 1])
#guard SelectionSort_postcond (#[5, 4, 3, 2, 1]) (#[1, 2, 3, 4, 5]) (by aesop)
#guard ¬(SelectionSort_postcond (#[5, 4, 3, 2, 1]) (#[5, 4, 3, 2, 1]) (by aesop))
#guard ¬(SelectionSort_postcond (#[5, 4, 3, 2, 1]) (#[1, 5, 4, 3, 2]) (by aesop))
#guard ¬(SelectionSort_postcond (#[5, 4, 3, 2, 1]) (#[1, 2, 4, 3, 5]) (by aesop))
#guard SelectionSort (#[5, 4, 3, 2, 1]) (by aesop) = (#[1, 2, 3, 4, 5])

-- Test case 4
#guard SelectionSort_precond (#[2, 2, 1, 4])
#guard SelectionSort_postcond (#[2, 2, 1, 4]) (#[1, 2, 2, 4]) (by aesop)
#guard ¬(SelectionSort_postcond (#[2, 2, 1, 4]) (#[2, 1, 2, 4]) (by aesop))
#guard ¬(SelectionSort_postcond (#[2, 2, 1, 4]) (#[1, 2, 4, 2]) (by aesop))
#guard SelectionSort (#[2, 2, 1, 4]) (by aesop) = (#[1, 2, 2, 4])

-- Test case 5
#guard SelectionSort_precond (#[10, -5, 0, 3])
#guard SelectionSort_postcond (#[10, -5, 0, 3]) (#[-5, 0, 3, 10]) (by aesop)
#guard ¬(SelectionSort_postcond (#[10, -5, 0, 3]) (#[10, -5, 3, 0]) (by aesop))
#guard ¬(SelectionSort_postcond (#[10, -5, 0, 3]) (#[0, -5, 3, 10]) (by aesop))
#guard ¬(SelectionSort_postcond (#[10, -5, 0, 3]) (#[3, -5, 10, 0]) (by aesop))
#guard SelectionSort (#[10, -5, 0, 3]) (by aesop) = (#[-5, 0, 3, 10])
