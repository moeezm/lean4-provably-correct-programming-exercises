import Aesop

/-
-----Description-----
This task requires writing a Lean 4 method that counts the unique elements from
a sorted array.

-----Input-----
The input is a single list of integers:
nums: An array of integers sorted in non-decreasing order.

-----Output-----
The output is a single integer:
Returns the number of unique elements (k).
-/

@[reducible, simp]
def removeDuplicates_precond (nums : List Int) : Prop := sorry

def removeDuplicates (nums : List Int) (h_precond : removeDuplicates_precond nums) : Nat := sorry

@[reducible, simp]
def removeDuplicates_postcond (nums : List Int) (result : Nat) (h_precond : removeDuplicates_precond nums) : Prop := sorry

theorem removeDuplicates_spec_satisfied (nums : List Int) (h_precond : removeDuplicates_precond nums) :
    removeDuplicates_postcond nums (removeDuplicates nums h_precond) h_precond := by
  sorry

-- Test Guards

-- Rejected inputs
#guard ¬(removeDuplicates_precond ([3, 2, 1]))

-- Test case 1
#guard removeDuplicates_precond ([1, 1, 2])
#guard removeDuplicates_postcond ([1, 1, 2]) (2) (by aesop)
#guard ¬(removeDuplicates_postcond ([1, 1, 2]) (1) (by aesop))
#guard ¬(removeDuplicates_postcond ([1, 1, 2]) (3) (by aesop))
#guard removeDuplicates ([1, 1, 2]) (by aesop) = (2)

-- Test case 2
#guard removeDuplicates_precond ([0, 0, 1, 1, 1, 2, 2, 3, 3, 4])
#guard removeDuplicates_postcond ([0, 0, 1, 1, 1, 2, 2, 3, 3, 4]) (5) (by aesop)
#guard ¬(removeDuplicates_postcond ([0, 0, 1, 1, 1, 2, 2, 3, 3, 4]) (4) (by aesop))
#guard ¬(removeDuplicates_postcond ([0, 0, 1, 1, 1, 2, 2, 3, 3, 4]) (10) (by aesop))
#guard removeDuplicates ([0, 0, 1, 1, 1, 2, 2, 3, 3, 4]) (by aesop) = (5)

-- Test case 3
#guard removeDuplicates_precond ([-1, -1, 0, 1, 2, 2, 3])
#guard removeDuplicates_postcond ([-1, -1, 0, 1, 2, 2, 3]) (5) (by aesop)
#guard ¬(removeDuplicates_postcond ([-1, -1, 0, 1, 2, 2, 3]) (3) (by aesop))
#guard removeDuplicates ([-1, -1, 0, 1, 2, 2, 3]) (by aesop) = (5)

-- Test case 4
#guard removeDuplicates_precond ([1, 2, 3, 4, 5])
#guard removeDuplicates_postcond ([1, 2, 3, 4, 5]) (5) (by aesop)
#guard ¬(removeDuplicates_postcond ([1, 2, 3, 4, 5]) (4) (by aesop))
#guard removeDuplicates ([1, 2, 3, 4, 5]) (by aesop) = (5)

-- Test case 5
#guard removeDuplicates_precond ([1, 1, 1, 1])
#guard removeDuplicates_postcond ([1, 1, 1, 1]) (1) (by aesop)
#guard ¬(removeDuplicates_postcond ([1, 1, 1, 1]) (2) (by aesop))
#guard ¬(removeDuplicates_postcond ([1, 1, 1, 1]) (4) (by aesop))
#guard removeDuplicates ([1, 1, 1, 1]) (by aesop) = (1)

-- Test case 6
#guard removeDuplicates_precond ([])
#guard removeDuplicates_postcond ([]) (0) (by aesop)
#guard ¬(removeDuplicates_postcond ([]) (1) (by aesop))
#guard removeDuplicates ([]) (by aesop) = (0)

-- Test case 7
#guard removeDuplicates_precond ([1])
#guard removeDuplicates_postcond ([1]) (1) (by aesop)
#guard ¬(removeDuplicates_postcond ([1]) (0) (by aesop))
#guard ¬(removeDuplicates_postcond ([1]) (2) (by aesop))
#guard removeDuplicates ([1]) (by aesop) = (1)

-- Test case 8
#guard removeDuplicates_precond ([-100, -100, -100])
#guard removeDuplicates_postcond ([-100, -100, -100]) (1) (by aesop)
#guard ¬(removeDuplicates_postcond ([-100, -100, -100]) (2) (by aesop))
#guard ¬(removeDuplicates_postcond ([-100, -100, -100]) (3) (by aesop))
#guard removeDuplicates ([-100, -100, -100]) (by aesop) = (1)

-- Test case 9
#guard removeDuplicates_precond ([-100, -99, -99, -50, 0, 0, 100, 100])
#guard removeDuplicates_postcond ([-100, -99, -99, -50, 0, 0, 100, 100]) (5) (by aesop)
#guard ¬(removeDuplicates_postcond ([-100, -99, -99, -50, 0, 0, 100, 100]) (6) (by aesop))
#guard ¬(removeDuplicates_postcond ([-100, -99, -99, -50, 0, 0, 100, 100]) (7) (by aesop))
#guard removeDuplicates ([-100, -99, -99, -50, 0, 0, 100, 100]) (by aesop) = (5)

-- Test case 10
#guard removeDuplicates_precond ([-1, 0, 0, 0, 1, 2, 2, 3, 4, 4, 5])
#guard removeDuplicates_postcond ([-1, 0, 0, 0, 1, 2, 2, 3, 4, 4, 5]) (7) (by aesop)
#guard ¬(removeDuplicates_postcond ([-1, 0, 0, 0, 1, 2, 2, 3, 4, 4, 5]) (6) (by aesop))
#guard ¬(removeDuplicates_postcond ([-1, 0, 0, 0, 1, 2, 2, 3, 4, 4, 5]) (10) (by aesop))
#guard removeDuplicates ([-1, 0, 0, 0, 1, 2, 2, 3, 4, 4, 5]) (by aesop) = (7)

-- Test case 11
#guard removeDuplicates_precond ([100, 100, 100, 101, 102, 102, 103, 104, 105, 105])
#guard removeDuplicates_postcond ([100, 100, 100, 101, 102, 102, 103, 104, 105, 105]) (6) (by aesop)
#guard ¬(removeDuplicates_postcond ([100, 100, 100, 101, 102, 102, 103, 104, 105, 105]) (5) (by aesop))
#guard ¬(removeDuplicates_postcond ([100, 100, 100, 101, 102, 102, 103, 104, 105, 105]) (7) (by aesop))
#guard removeDuplicates ([100, 100, 100, 101, 102, 102, 103, 104, 105, 105]) (by aesop) = (6)
