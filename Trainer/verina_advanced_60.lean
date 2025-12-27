import Aesop

/-
-----Description-----

This task requires writing a Lean 4 method that takes a list of natural numbers
and partitions it into two separate lists: one containing all the even numbers
and the other containing all the odd numbers. The order of elements in each
sublist should match their appearance in the original list. Assume there are no
duplicates in the input.

-----Input-----

The input consists of a single list with no duplicate natural numbers:
- nums: A list of natural numbers (Nat)

-----Output-----

The output is a tuple of two lists:
- The first list contains all even numbers from the input list, in order.
- The second list contains all odd numbers from the input list, in order.


-/

@[reducible, simp]
def partitionEvensOdds_precond (nums : List Nat) : Prop := sorry

def partitionEvensOdds (nums : List Nat) (h_precond : partitionEvensOdds_precond nums) : (List Nat × List Nat) := sorry

@[reducible, simp]
def partitionEvensOdds_postcond (nums : List Nat) (result : (List Nat × List Nat)) (h_precond : partitionEvensOdds_precond nums) : Prop := sorry

theorem partitionEvensOdds_spec_satisfied (nums : List Nat) (h_precond : partitionEvensOdds_precond nums) :
    partitionEvensOdds_postcond nums (partitionEvensOdds nums h_precond) h_precond := by
  sorry

-- Test Guards

-- Test case 1
#guard partitionEvensOdds_precond ([1, 2, 3, 4, 5, 6])
#guard partitionEvensOdds_postcond ([1, 2, 3, 4, 5, 6]) ("([2, 4, 6], [1, 3, 5])") (by aesop)
#guard ¬(partitionEvensOdds_postcond ([1, 2, 3, 4, 5, 6]) ("([1, 3, 5], [2, 4, 6])") (by aesop))
#guard partitionEvensOdds ([1, 2, 3, 4, 5, 6]) (by aesop) = ("([2, 4, 6], [1, 3, 5])")

-- Test case 2
#guard partitionEvensOdds_precond ([0, 7, 8, 9, 10])
#guard partitionEvensOdds_postcond ([0, 7, 8, 9, 10]) ("([0, 8, 10], [7, 9])") (by aesop)
#guard ¬(partitionEvensOdds_postcond ([0, 7, 8, 9, 10]) ("([8, 0, 10], [9, 7])") (by aesop))
#guard partitionEvensOdds ([0, 7, 8, 9, 10]) (by aesop) = ("([0, 8, 10], [7, 9])")

-- Test case 3
#guard partitionEvensOdds_precond ([])
#guard partitionEvensOdds_postcond ([]) ("([], [])") (by aesop)
#guard ¬(partitionEvensOdds_postcond ([]) ("([0], [1])") (by aesop))
#guard partitionEvensOdds ([]) (by aesop) = ("([], [])")

-- Test case 4
#guard partitionEvensOdds_precond ([2, 4, 6, 8])
#guard partitionEvensOdds_postcond ([2, 4, 6, 8]) ("([2, 4, 6, 8], [])") (by aesop)
#guard ¬(partitionEvensOdds_postcond ([2, 4, 6, 8]) ("([], [2, 4, 6, 8])") (by aesop))
#guard partitionEvensOdds ([2, 4, 6, 8]) (by aesop) = ("([2, 4, 6, 8], [])")

-- Test case 5
#guard partitionEvensOdds_precond ([1, 3, 5, 7])
#guard partitionEvensOdds_postcond ([1, 3, 5, 7]) ("([], [1, 3, 5, 7])") (by aesop)
#guard ¬(partitionEvensOdds_postcond ([1, 3, 5, 7]) ("([1, 3, 5, 7], [])") (by aesop))
#guard partitionEvensOdds ([1, 3, 5, 7]) (by aesop) = ("([], [1, 3, 5, 7])")
