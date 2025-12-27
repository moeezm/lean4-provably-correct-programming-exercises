import Aesop

/-
-----Description-----
This task requires writing a Lean 4 function that finds the single number in a
non-empty list of integers, where every element appears exactly twice except for
one element that appears only once. The function
should return the integer that appears only once.

-----Input-----
The input is a non-empty list of integers:
- nums: A list in which each integer appears exactly twice except for one
element that appears only once.

-----Output-----
The output is a single integer:
Returns the unique integer that appears exactly once in the list.


-/

@[reducible, simp]
def FindSingleNumber_precond (nums : List Int) : Prop := sorry

def FindSingleNumber (nums : List Int) (h_precond : FindSingleNumber_precond nums) : Int := sorry

@[reducible, simp]
def FindSingleNumber_postcond (nums : List Int) (result : Int) (h_precond : FindSingleNumber_precond nums) : Prop := sorry

theorem FindSingleNumber_spec_satisfied (nums : List Int) (h_precond : FindSingleNumber_precond nums) :
    FindSingleNumber_postcond nums (FindSingleNumber nums h_precond) h_precond := by
  sorry

-- Test Guards

-- Rejected inputs
#guard ¬(FindSingleNumber_precond ([2, 2]))
#guard ¬(FindSingleNumber_precond ([2, 2, 3, 3]))

-- Test case 1
#guard FindSingleNumber_precond ([2, 2, 3])
#guard FindSingleNumber_postcond ([2, 2, 3]) (3) (by aesop)
#guard ¬(FindSingleNumber_postcond ([2, 2, 3]) (2) (by aesop))
#guard ¬(FindSingleNumber_postcond ([2, 2, 3]) (1) (by aesop))
#guard ¬(FindSingleNumber_postcond ([2, 2, 3]) (4) (by aesop))
#guard FindSingleNumber ([2, 2, 3]) (by aesop) = (3)

-- Test case 2
#guard FindSingleNumber_precond ([1, 2, 2])
#guard FindSingleNumber_postcond ([1, 2, 2]) (1) (by aesop)
#guard ¬(FindSingleNumber_postcond ([1, 2, 2]) (2) (by aesop))
#guard ¬(FindSingleNumber_postcond ([1, 2, 2]) (-1) (by aesop))
#guard FindSingleNumber ([1, 2, 2]) (by aesop) = (1)

-- Test case 3
#guard FindSingleNumber_precond ([3, 3, 4, 4, 1])
#guard FindSingleNumber_postcond ([3, 3, 4, 4, 1]) (1) (by aesop)
#guard ¬(FindSingleNumber_postcond ([3, 3, 4, 4, 1]) (3) (by aesop))
#guard ¬(FindSingleNumber_postcond ([3, 3, 4, 4, 1]) (4) (by aesop))
#guard FindSingleNumber ([3, 3, 4, 4, 1]) (by aesop) = (1)

-- Test case 4
#guard FindSingleNumber_precond ([0, 1, 3, 1, 3, 88, 88, 100, 100])
#guard FindSingleNumber_postcond ([0, 1, 3, 1, 3, 88, 88, 100, 100]) (0) (by aesop)
#guard ¬(FindSingleNumber_postcond ([0, 1, 3, 1, 3, 88, 88, 100, 100]) (1) (by aesop))
#guard ¬(FindSingleNumber_postcond ([0, 1, 3, 1, 3, 88, 88, 100, 100]) (2) (by aesop))
#guard ¬(FindSingleNumber_postcond ([0, 1, 3, 1, 3, 88, 88, 100, 100]) (100) (by aesop))
#guard FindSingleNumber ([0, 1, 3, 1, 3, 88, 88, 100, 100]) (by aesop) = (0)

-- Test case 5
#guard FindSingleNumber_precond ([-1, -1, 7, 9, 7])
#guard FindSingleNumber_postcond ([-1, -1, 7, 9, 7]) (9) (by aesop)
#guard ¬(FindSingleNumber_postcond ([-1, -1, 7, 9, 7]) (-1) (by aesop))
#guard ¬(FindSingleNumber_postcond ([-1, -1, 7, 9, 7]) (7) (by aesop))
#guard ¬(FindSingleNumber_postcond ([-1, -1, 7, 9, 7]) (10) (by aesop))
#guard FindSingleNumber ([-1, -1, 7, 9, 7]) (by aesop) = (9)
