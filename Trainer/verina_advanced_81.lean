import Aesop

/-
-----Description-----
Implement a Lean 4 function that, given a list of integers, removes all
duplicates and returns the resulting list in ascending order.

-----Input-----
The input consists of a single list of integers:
arr: A list of integers.

-----Output-----
The output is a list of integers:
Returns a list containing the unique elements of the input, sorted in ascending
order. The returned list must not contain any duplicates, and every element in
the output must appear in the original input list.


-/

@[reducible, simp]
def uniqueSorted_precond (arr : List Int) : Prop := sorry

def uniqueSorted (arr : List Int) (h_precond : uniqueSorted_precond arr) : List Int := sorry

@[reducible, simp]
def uniqueSorted_postcond (arr : List Int) (result : List Int) (h_precond : uniqueSorted_precond arr) : Prop := sorry

theorem uniqueSorted_spec_satisfied (arr : List Int) (h_precond : uniqueSorted_precond arr) :
    uniqueSorted_postcond arr (uniqueSorted arr h_precond) h_precond := by
  sorry

-- Test Guards

-- Test case 1
#guard uniqueSorted_precond ([1, 1, 2, 3])
#guard uniqueSorted_postcond ([1, 1, 2, 3]) ([1, 2, 3]) (by aesop)
#guard ¬(uniqueSorted_postcond ([1, 1, 2, 3]) ([1, 1, 2, 3]) (by aesop))
#guard ¬(uniqueSorted_postcond ([1, 1, 2, 3]) ([2, 3, 1]) (by aesop))
#guard ¬(uniqueSorted_postcond ([1, 1, 2, 3]) ([1, 3, 2]) (by aesop))
#guard uniqueSorted ([1, 1, 2, 3]) (by aesop) = ([1, 2, 3])

-- Test case 2
#guard uniqueSorted_precond ([3, 3, 3])
#guard uniqueSorted_postcond ([3, 3, 3]) ([3]) (by aesop)
#guard ¬(uniqueSorted_postcond ([3, 3, 3]) ([3, 3, 3]) (by aesop))
#guard ¬(uniqueSorted_postcond ([3, 3, 3]) ([3, 3]) (by aesop))
#guard ¬(uniqueSorted_postcond ([3, 3, 3]) ([3, 3, 3, 3]) (by aesop))
#guard uniqueSorted ([3, 3, 3]) (by aesop) = ([3])

-- Test case 3
#guard uniqueSorted_precond ([])
#guard uniqueSorted_postcond ([]) ([]) (by aesop)
#guard ¬(uniqueSorted_postcond ([]) ([0]) (by aesop))
#guard ¬(uniqueSorted_postcond ([]) ([1]) (by aesop))
#guard ¬(uniqueSorted_postcond ([]) ([999]) (by aesop))
#guard uniqueSorted ([]) (by aesop) = ([])

-- Test case 4
#guard uniqueSorted_precond ([5, 2, 2, 5])
#guard uniqueSorted_postcond ([5, 2, 2, 5]) ([2, 5]) (by aesop)
#guard ¬(uniqueSorted_postcond ([5, 2, 2, 5]) ([5, 2]) (by aesop))
#guard ¬(uniqueSorted_postcond ([5, 2, 2, 5]) ([2, 2, 5]) (by aesop))
#guard ¬(uniqueSorted_postcond ([5, 2, 2, 5]) ([2]) (by aesop))
#guard uniqueSorted ([5, 2, 2, 5]) (by aesop) = ([2, 5])

-- Test case 5
#guard uniqueSorted_precond ([1, 2, 3, 4, 5])
#guard uniqueSorted_postcond ([1, 2, 3, 4, 5]) ([1, 2, 3, 4, 5]) (by aesop)
#guard ¬(uniqueSorted_postcond ([1, 2, 3, 4, 5]) ([1, 2, 3]) (by aesop))
#guard ¬(uniqueSorted_postcond ([1, 2, 3, 4, 5]) ([2, 3, 4, 5]) (by aesop))
#guard ¬(uniqueSorted_postcond ([1, 2, 3, 4, 5]) ([5, 4, 3, 2, 1]) (by aesop))
#guard uniqueSorted ([1, 2, 3, 4, 5]) (by aesop) = ([1, 2, 3, 4, 5])
