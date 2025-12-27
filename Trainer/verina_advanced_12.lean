import Aesop

/-
-----Description-----
Write a Lean 4 function that returns the first duplicate integer found in a
list. The function should return the value of the first duplicate it encounters,
scanning from left to right. If no duplicates exist, return -1.

-----Input-----
lst: A list of integers.

-----Output-----
An integer representing the first duplicated value if any exists, otherwise -1.


-/

@[reducible, simp]
def firstDuplicate_precond (lst : List Int) : Prop := sorry

def firstDuplicate (lst : List Int) (h_precond : firstDuplicate_precond lst) : Int := sorry

@[reducible, simp]
def firstDuplicate_postcond (lst : List Int) (result : Int) (h_precond : firstDuplicate_precond lst) : Prop := sorry

theorem firstDuplicate_spec_satisfied (lst : List Int) (h_precond : firstDuplicate_precond lst) :
    firstDuplicate_postcond lst (firstDuplicate lst h_precond) h_precond := by
  sorry

-- Test Guards

-- Test case 1
#guard firstDuplicate_precond ([1, 2, 3, 2, 4])
#guard firstDuplicate_postcond ([1, 2, 3, 2, 4]) (2) (by aesop)
#guard ¬(firstDuplicate_postcond ([1, 2, 3, 2, 4]) (1) (by aesop))
#guard ¬(firstDuplicate_postcond ([1, 2, 3, 2, 4]) (3) (by aesop))
#guard ¬(firstDuplicate_postcond ([1, 2, 3, 2, 4]) (-1) (by aesop))
#guard firstDuplicate ([1, 2, 3, 2, 4]) (by aesop) = (2)

-- Test case 2
#guard firstDuplicate_precond ([5, 1, 2, 3, 4, 5])
#guard firstDuplicate_postcond ([5, 1, 2, 3, 4, 5]) (5) (by aesop)
#guard ¬(firstDuplicate_postcond ([5, 1, 2, 3, 4, 5]) (1) (by aesop))
#guard ¬(firstDuplicate_postcond ([5, 1, 2, 3, 4, 5]) (0) (by aesop))
#guard firstDuplicate ([5, 1, 2, 3, 4, 5]) (by aesop) = (5)

-- Test case 3
#guard firstDuplicate_precond ([1, 2, 3, 4, 5])
#guard firstDuplicate_postcond ([1, 2, 3, 4, 5]) (-1) (by aesop)
#guard ¬(firstDuplicate_postcond ([1, 2, 3, 4, 5]) (1) (by aesop))
#guard ¬(firstDuplicate_postcond ([1, 2, 3, 4, 5]) (2) (by aesop))
#guard ¬(firstDuplicate_postcond ([1, 2, 3, 4, 5]) (3) (by aesop))
#guard firstDuplicate ([1, 2, 3, 4, 5]) (by aesop) = (-1)

-- Test case 4
#guard firstDuplicate_precond ([7, 7, 7, 7])
#guard firstDuplicate_postcond ([7, 7, 7, 7]) (7) (by aesop)
#guard ¬(firstDuplicate_postcond ([7, 7, 7, 7]) (-1) (by aesop))
#guard firstDuplicate ([7, 7, 7, 7]) (by aesop) = (7)

-- Test case 5
#guard firstDuplicate_precond ([])
#guard firstDuplicate_postcond ([]) (-1) (by aesop)
#guard ¬(firstDuplicate_postcond ([]) (0) (by aesop))
#guard ¬(firstDuplicate_postcond ([]) (1) (by aesop))
#guard ¬(firstDuplicate_postcond ([]) (2) (by aesop))
#guard firstDuplicate ([]) (by aesop) = (-1)
