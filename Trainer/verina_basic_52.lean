import Aesop

/-
-----Description-----  
This task requires developing a solution that sorts an array of integers in
non-decreasing order. The solution must return an array that is a rearrangement
of the input, containing exactly the same elements but ordered from smallest to
largest.

-----Input-----  
The input consists of:  
• a: An array of integers. This array can be empty or non-empty.

-----Output-----  
The output is an array of integers that:  
• Is sorted in non-decreasing order (i.e., for any indices i and j with i < j,
a[i]! ≤ a[j]!).
• Has the same size as the input array.  
• Contains exactly the same elements as the input array, ensuring that the
multiset of elements is preserved.

-----Note-----  
The implementation uses helper functions for swapping elements and performing
inner and outer loops of the bubble sort algorithm. No additional preconditions
are required as the function should correctly handle empty and non-empty arrays.
-/

@[reducible, simp]
def BubbleSort_precond (a : Array Int) : Prop := sorry

def BubbleSort (a : Array Int) (h_precond : BubbleSort_precond a) : Array Int := sorry

@[reducible, simp]
def BubbleSort_postcond (a : Array Int) (result : Array Int) (h_precond : BubbleSort_precond a) : Prop := sorry

theorem BubbleSort_spec_satisfied (a : Array Int) (h_precond : BubbleSort_precond a) :
    BubbleSort_postcond a (BubbleSort a h_precond) h_precond := by
  sorry

-- Test Guards

-- Test case 1
#guard BubbleSort_precond (#[5, 4, 3, 2, 1])
#guard BubbleSort_postcond (#[5, 4, 3, 2, 1]) (#[1, 2, 3, 4, 5]) (by aesop)
#guard ¬(BubbleSort_postcond (#[5, 4, 3, 2, 1]) (#[5, 4, 3, 2, 1]) (by aesop))
#guard ¬(BubbleSort_postcond (#[5, 4, 3, 2, 1]) (#[2, 3, 1, 4, 5]) (by aesop))
#guard BubbleSort (#[5, 4, 3, 2, 1]) (by aesop) = (#[1, 2, 3, 4, 5])

-- Test case 2
#guard BubbleSort_precond (#[1, 2, 3, 4, 5])
#guard BubbleSort_postcond (#[1, 2, 3, 4, 5]) (#[1, 2, 3, 4, 5]) (by aesop)
#guard ¬(BubbleSort_postcond (#[1, 2, 3, 4, 5]) (#[5, 4, 3, 2, 1]) (by aesop))
#guard ¬(BubbleSort_postcond (#[1, 2, 3, 4, 5]) (#[1, 3, 2, 4, 5]) (by aesop))
#guard BubbleSort (#[1, 2, 3, 4, 5]) (by aesop) = (#[1, 2, 3, 4, 5])

-- Test case 3
#guard BubbleSort_precond (#[3, 1, 2, 1, 5])
#guard BubbleSort_postcond (#[3, 1, 2, 1, 5]) (#[1, 1, 2, 3, 5]) (by aesop)
#guard ¬(BubbleSort_postcond (#[3, 1, 2, 1, 5]) (#[1, 2, 3, 1, 5]) (by aesop))
#guard ¬(BubbleSort_postcond (#[3, 1, 2, 1, 5]) (#[3, 1, 2, 5, 1]) (by aesop))
#guard BubbleSort (#[3, 1, 2, 1, 5]) (by aesop) = (#[1, 1, 2, 3, 5])

-- Test case 4
#guard BubbleSort_precond (#[10])
#guard BubbleSort_postcond (#[10]) (#[10]) (by aesop)
#guard ¬(BubbleSort_postcond (#[10]) (#[0]) (by aesop))
#guard ¬(BubbleSort_postcond (#[10]) (#[10, 10]) (by aesop))
#guard BubbleSort (#[10]) (by aesop) = (#[10])

-- Test case 5
#guard BubbleSort_precond (#[4, 4, 4, 2, 2, 8])
#guard BubbleSort_postcond (#[4, 4, 4, 2, 2, 8]) (#[2, 2, 4, 4, 4, 8]) (by aesop)
#guard ¬(BubbleSort_postcond (#[4, 4, 4, 2, 2, 8]) (#[2, 4, 4, 2, 4, 8]) (by aesop))
#guard ¬(BubbleSort_postcond (#[4, 4, 4, 2, 2, 8]) (#[4, 2, 4, 2, 4, 8]) (by aesop))
#guard ¬(BubbleSort_postcond (#[4, 4, 4, 2, 2, 8]) (#[2, 4, 2, 4, 4, 8]) (by aesop))
#guard BubbleSort (#[4, 4, 4, 2, 2, 8]) (by aesop) = (#[2, 2, 4, 4, 4, 8])
