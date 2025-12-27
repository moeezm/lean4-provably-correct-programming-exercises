import Aesop

/-
-----Description----- 
This task requires writing a Lean 4 method that identifies the dissimilar
elements between two arrays of integers. In other words, the method should
return an array containing all elements that appear in one input array but not
in the other. The output array must contain no duplicate elements and the order
of elements does not matter.

-----Input-----
The input consists of:
a: An array of integers.
b: An array of integers.

-----Output-----
The output is an array of integers:
Returns an array containing all distinct elements from both input arrays that
are not present in the other array and should be sorted
-/

@[reducible, simp]
def dissimilarElements_precond (a : Array Int) (b : Array Int) : Prop := sorry

def dissimilarElements (a : Array Int) (b : Array Int) (h_precond : dissimilarElements_precond a b) : Array Int := sorry

@[reducible, simp]
def dissimilarElements_postcond (a : Array Int) (b : Array Int) (result : Array Int) (h_precond : dissimilarElements_precond a b) : Prop := sorry

theorem dissimilarElements_spec_satisfied (a : Array Int) (b : Array Int) (h_precond : dissimilarElements_precond a b) :
    dissimilarElements_postcond a b (dissimilarElements a b h_precond) h_precond := by
  sorry

-- Test Guards

-- Test case 1
#guard dissimilarElements_precond (#[1, 2, 3, 4]) (#[3, 4, 5, 6])
#guard dissimilarElements_postcond (#[1, 2, 3, 4]) (#[3, 4, 5, 6]) (#[1, 2, 5, 6]) (by aesop)
#guard ¬(dissimilarElements_postcond (#[1, 2, 3, 4]) (#[3, 4, 5, 6]) (#[1,2,3,4,5,6]) (by aesop))
#guard ¬(dissimilarElements_postcond (#[1, 2, 3, 4]) (#[3, 4, 5, 6]) (#[3,4]) (by aesop))
#guard ¬(dissimilarElements_postcond (#[1, 2, 3, 4]) (#[3, 4, 5, 6]) (#[1,3,5]) (by aesop))
#guard dissimilarElements (#[1, 2, 3, 4]) (#[3, 4, 5, 6]) (by aesop) = (#[1, 2, 5, 6])

-- Test case 2
#guard dissimilarElements_precond (#[1, 1, 2]) (#[2, 3])
#guard dissimilarElements_postcond (#[1, 1, 2]) (#[2, 3]) (#[1, 3]) (by aesop)
#guard ¬(dissimilarElements_postcond (#[1, 1, 2]) (#[2, 3]) (#[1]) (by aesop))
#guard ¬(dissimilarElements_postcond (#[1, 1, 2]) (#[2, 3]) (#[3]) (by aesop))
#guard ¬(dissimilarElements_postcond (#[1, 1, 2]) (#[2, 3]) (#[1,2,3]) (by aesop))
#guard dissimilarElements (#[1, 1, 2]) (#[2, 3]) (by aesop) = (#[1, 3])

-- Test case 3
#guard dissimilarElements_precond (#[]) (#[4, 5])
#guard dissimilarElements_postcond (#[]) (#[4, 5]) (#[4, 5]) (by aesop)
#guard ¬(dissimilarElements_postcond (#[]) (#[4, 5]) (#[4]) (by aesop))
#guard ¬(dissimilarElements_postcond (#[]) (#[4, 5]) (#[5]) (by aesop))
#guard ¬(dissimilarElements_postcond (#[]) (#[4, 5]) (#[]) (by aesop))
#guard dissimilarElements (#[]) (#[4, 5]) (by aesop) = (#[4, 5])

-- Test case 4
#guard dissimilarElements_precond (#[7, 8]) (#[])
#guard dissimilarElements_postcond (#[7, 8]) (#[]) (#[7, 8]) (by aesop)
#guard ¬(dissimilarElements_postcond (#[7, 8]) (#[]) (#[7]) (by aesop))
#guard ¬(dissimilarElements_postcond (#[7, 8]) (#[]) (#[8]) (by aesop))
#guard ¬(dissimilarElements_postcond (#[7, 8]) (#[]) (#[7, 8, 9]) (by aesop))
#guard dissimilarElements (#[7, 8]) (#[]) (by aesop) = (#[7, 8])

-- Test case 5
#guard dissimilarElements_precond (#[1, 2, 3]) (#[1, 2, 3])
#guard dissimilarElements_postcond (#[1, 2, 3]) (#[1, 2, 3]) (#[]) (by aesop)
#guard ¬(dissimilarElements_postcond (#[1, 2, 3]) (#[1, 2, 3]) (#[1]) (by aesop))
#guard ¬(dissimilarElements_postcond (#[1, 2, 3]) (#[1, 2, 3]) (#[1,2]) (by aesop))
#guard ¬(dissimilarElements_postcond (#[1, 2, 3]) (#[1, 2, 3]) (#[1,2,3]) (by aesop))
#guard dissimilarElements (#[1, 2, 3]) (#[1, 2, 3]) (by aesop) = (#[])

-- Test case 6
#guard dissimilarElements_precond (#[1, 2, 3]) (#[4, 5, 6])
#guard dissimilarElements_postcond (#[1, 2, 3]) (#[4, 5, 6]) (#[1, 2, 3, 4, 5, 6]) (by aesop)
#guard ¬(dissimilarElements_postcond (#[1, 2, 3]) (#[4, 5, 6]) (#[1,2,3,4]) (by aesop))
#guard ¬(dissimilarElements_postcond (#[1, 2, 3]) (#[4, 5, 6]) (#[4,5,6]) (by aesop))
#guard ¬(dissimilarElements_postcond (#[1, 2, 3]) (#[4, 5, 6]) (#[1,2,3]) (by aesop))
#guard dissimilarElements (#[1, 2, 3]) (#[4, 5, 6]) (by aesop) = (#[1, 2, 3, 4, 5, 6])

-- Test case 7
#guard dissimilarElements_precond (#[-1, 0, 1]) (#[0])
#guard dissimilarElements_postcond (#[-1, 0, 1]) (#[0]) (#[-1, 1]) (by aesop)
#guard ¬(dissimilarElements_postcond (#[-1, 0, 1]) (#[0]) (#[0]) (by aesop))
#guard ¬(dissimilarElements_postcond (#[-1, 0, 1]) (#[0]) (#[-1,0,1]) (by aesop))
#guard ¬(dissimilarElements_postcond (#[-1, 0, 1]) (#[0]) (#[-1]) (by aesop))
#guard dissimilarElements (#[-1, 0, 1]) (#[0]) (by aesop) = (#[-1, 1])
