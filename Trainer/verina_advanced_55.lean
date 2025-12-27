import Aesop

/-
-----Description-----
This task requires writing a Lean 4 method that returns the integer that
appears most frequently in the input list. If multiple integers have the same
maximum frequency, return the one that appears first in the original list. You
should implement a frequency counter using a fold over the list, extract the
maximum frequency, and return the first element in the list that matches it.

-----Input-----
The input consists of:
xs: A list of integers (possibly with duplicates). The list is guaranteed to be
non-empty.

-----Output-----
The output is an integer:
Returns the number that appears the most frequently in the list. If there is a
tie, the element that occurs first in the original list should be returned.


-/

@[reducible, simp]
def mostFrequent_precond (xs : List Int) : Prop := sorry

def mostFrequent (xs : List Int) (h_precond : mostFrequent_precond xs) : Int := sorry

@[reducible, simp]
def mostFrequent_postcond (xs : List Int) (result : Int) (h_precond : mostFrequent_precond xs) : Prop := sorry

theorem mostFrequent_spec_satisfied (xs : List Int) (h_precond : mostFrequent_precond xs) :
    mostFrequent_postcond xs (mostFrequent xs h_precond) h_precond := by
  sorry

-- Test Guards

-- Rejected inputs
#guard ¬(mostFrequent_precond ([]))

-- Test case 1
#guard mostFrequent_precond ([1, 2, 2, 3])
#guard mostFrequent_postcond ([1, 2, 2, 3]) (2) (by aesop)
#guard ¬(mostFrequent_postcond ([1, 2, 2, 3]) (1) (by aesop))
#guard ¬(mostFrequent_postcond ([1, 2, 2, 3]) (3) (by aesop))
#guard mostFrequent ([1, 2, 2, 3]) (by aesop) = (2)

-- Test case 2
#guard mostFrequent_precond ([4, 4, 5, 5, 4])
#guard mostFrequent_postcond ([4, 4, 5, 5, 4]) (4) (by aesop)
#guard ¬(mostFrequent_postcond ([4, 4, 5, 5, 4]) (5) (by aesop))
#guard mostFrequent ([4, 4, 5, 5, 4]) (by aesop) = (4)

-- Test case 3
#guard mostFrequent_precond ([9])
#guard mostFrequent_postcond ([9]) (9) (by aesop)
#guard ¬(mostFrequent_postcond ([9]) (0) (by aesop))
#guard mostFrequent ([9]) (by aesop) = (9)

-- Test case 4
#guard mostFrequent_precond ([1, 2, 3, 1, 2, 3, 2])
#guard mostFrequent_postcond ([1, 2, 3, 1, 2, 3, 2]) (2) (by aesop)
#guard ¬(mostFrequent_postcond ([1, 2, 3, 1, 2, 3, 2]) (1) (by aesop))
#guard ¬(mostFrequent_postcond ([1, 2, 3, 1, 2, 3, 2]) (3) (by aesop))
#guard mostFrequent ([1, 2, 3, 1, 2, 3, 2]) (by aesop) = (2)

-- Test case 5
#guard mostFrequent_precond ([7, 7, 8, 8, 9, 9, 7])
#guard mostFrequent_postcond ([7, 7, 8, 8, 9, 9, 7]) (7) (by aesop)
#guard ¬(mostFrequent_postcond ([7, 7, 8, 8, 9, 9, 7]) (8) (by aesop))
#guard ¬(mostFrequent_postcond ([7, 7, 8, 8, 9, 9, 7]) (9) (by aesop))
#guard mostFrequent ([7, 7, 8, 8, 9, 9, 7]) (by aesop) = (7)
