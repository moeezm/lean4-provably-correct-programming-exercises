import Aesop

/-
-----Description-----
This task requires creating a function that determines the correct insertion
index for a given integer in a sorted array. The goal is to identify an index
where every number before it is less than the specified value, and every number
from that index onward is greater than or equal to the value. If the given
integer is larger than all elements in the array, the function should return the
array’s size.

-----Input-----
The input consists of:
• a: An array of integers that is assumed to be sorted in non-decreasing order.
• key: An integer to search for in the array.

-----Output-----
The output is a natural number (Nat) representing the index determined by the
binary search. The index satisfies the following postconditions:
• It is between 0 and the size of the array.
• Every element before the returned index is less than the key.
• If the returned index equals the size of the array, then all elements are
less than the key.
• Every element from the index onwards is greater than or equal to the key.

-----Note-----
It is assumed that the input array is sorted in non-decreasing order. The
function returns the first index where the key could be inserted while
maintaining the sorted order.
-/

@[reducible, simp]
def BinarySearch_precond (a : Array Int) (key : Int) : Prop := sorry

def BinarySearch (a : Array Int) (key : Int) (h_precond : BinarySearch_precond a key) : Nat := sorry

@[reducible, simp]
def BinarySearch_postcond (a : Array Int) (key : Int) (result : Nat) (h_precond : BinarySearch_precond a key) : Prop := sorry

theorem BinarySearch_spec_satisfied (a : Array Int) (key : Int) (h_precond : BinarySearch_precond a key) :
    BinarySearch_postcond a key (BinarySearch a key h_precond) h_precond := by
  sorry

-- Test Guards

-- Rejected inputs
#guard ¬(BinarySearch_precond (#[3, 2, 1]) (2))

-- Test case 1
#guard BinarySearch_precond (#[1, 3, 5, 7, 9]) (5)
#guard BinarySearch_postcond (#[1, 3, 5, 7, 9]) (5) ("2") (by aesop)
#guard ¬(BinarySearch_postcond (#[1, 3, 5, 7, 9]) (5) ("1") (by aesop))
#guard ¬(BinarySearch_postcond (#[1, 3, 5, 7, 9]) (5) ("3") (by aesop))
#guard ¬(BinarySearch_postcond (#[1, 3, 5, 7, 9]) (5) ("4") (by aesop))
#guard BinarySearch (#[1, 3, 5, 7, 9]) (5) (by aesop) = ("2")

-- Test case 2
#guard BinarySearch_precond (#[1, 3, 5, 7, 9]) (6)
#guard BinarySearch_postcond (#[1, 3, 5, 7, 9]) (6) ("3") (by aesop)
#guard ¬(BinarySearch_postcond (#[1, 3, 5, 7, 9]) (6) ("2") (by aesop))
#guard ¬(BinarySearch_postcond (#[1, 3, 5, 7, 9]) (6) ("4") (by aesop))
#guard ¬(BinarySearch_postcond (#[1, 3, 5, 7, 9]) (6) ("5") (by aesop))
#guard BinarySearch (#[1, 3, 5, 7, 9]) (6) (by aesop) = ("3")

-- Test case 3
#guard BinarySearch_precond (#[2, 4, 6, 8]) (1)
#guard BinarySearch_postcond (#[2, 4, 6, 8]) (1) ("0") (by aesop)
#guard ¬(BinarySearch_postcond (#[2, 4, 6, 8]) (1) ("1") (by aesop))
#guard ¬(BinarySearch_postcond (#[2, 4, 6, 8]) (1) ("2") (by aesop))
#guard ¬(BinarySearch_postcond (#[2, 4, 6, 8]) (1) ("3") (by aesop))
#guard BinarySearch (#[2, 4, 6, 8]) (1) (by aesop) = ("0")

-- Test case 4
#guard BinarySearch_precond (#[2, 4, 6, 8]) (10)
#guard BinarySearch_postcond (#[2, 4, 6, 8]) (10) ("4") (by aesop)
#guard ¬(BinarySearch_postcond (#[2, 4, 6, 8]) (10) ("3") (by aesop))
#guard ¬(BinarySearch_postcond (#[2, 4, 6, 8]) (10) ("5") (by aesop))
#guard ¬(BinarySearch_postcond (#[2, 4, 6, 8]) (10) ("6") (by aesop))
#guard BinarySearch (#[2, 4, 6, 8]) (10) (by aesop) = ("4")

-- Test case 5
#guard BinarySearch_precond (#[1, 1, 1, 1]) (1)
#guard BinarySearch_postcond (#[1, 1, 1, 1]) (1) ("0") (by aesop)
#guard ¬(BinarySearch_postcond (#[1, 1, 1, 1]) (1) ("1") (by aesop))
#guard ¬(BinarySearch_postcond (#[1, 1, 1, 1]) (1) ("2") (by aesop))
#guard ¬(BinarySearch_postcond (#[1, 1, 1, 1]) (1) ("3") (by aesop))
#guard BinarySearch (#[1, 1, 1, 1]) (1) (by aesop) = ("0")
