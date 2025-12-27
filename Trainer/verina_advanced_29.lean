import Aesop

/-
-----Description----- 
You are given a natural number array nums and a natural number k.
The frequency of an element x is the number of times it occurs in an array.
An array is called good if the frequency of each element in this array is less
than or equal to k.
Return the length of the longest good subarray of nums.
A subarray is a contiguous non-empty sequence of elements within an array.

-----Input-----
The input consists of an array of natural numbers nums and a natural number k:
nums: an array of natural numbers.
k: a natural number

-----Output-----
The output is a natural number:
Return the length of the longest good subarray of nums.


-/

@[reducible, simp]
def longestGoodSubarray_precond (nums : List Nat) (k : Nat) : Prop := sorry

def longestGoodSubarray (nums : List Nat) (k : Nat) (h_precond : longestGoodSubarray_precond nums k) : Nat := sorry

@[reducible, simp]
def longestGoodSubarray_postcond (nums : List Nat) (k : Nat) (result : Nat) (h_precond : longestGoodSubarray_precond nums k) : Prop := sorry

theorem longestGoodSubarray_spec_satisfied (nums : List Nat) (k : Nat) (h_precond : longestGoodSubarray_precond nums k) :
    longestGoodSubarray_postcond nums k (longestGoodSubarray nums k h_precond) h_precond := by
  sorry

-- Test Guards

-- Test case 1
#guard longestGoodSubarray_precond ([1, 2, 3, 1, 2, 3, 1, 2]) (2)
#guard longestGoodSubarray_postcond ([1, 2, 3, 1, 2, 3, 1, 2]) (2) (6) (by aesop)
#guard ¬(longestGoodSubarray_postcond ([1, 2, 3, 1, 2, 3, 1, 2]) (2) (5) (by aesop))
#guard ¬(longestGoodSubarray_postcond ([1, 2, 3, 1, 2, 3, 1, 2]) (2) (7) (by aesop))
#guard ¬(longestGoodSubarray_postcond ([1, 2, 3, 1, 2, 3, 1, 2]) (2) (8) (by aesop))
#guard longestGoodSubarray ([1, 2, 3, 1, 2, 3, 1, 2]) (2) (by aesop) = (6)

-- Test case 2
#guard longestGoodSubarray_precond ([1, 2, 1, 2, 1, 2, 1, 2]) (1)
#guard longestGoodSubarray_postcond ([1, 2, 1, 2, 1, 2, 1, 2]) (1) (2) (by aesop)
#guard ¬(longestGoodSubarray_postcond ([1, 2, 1, 2, 1, 2, 1, 2]) (1) (1) (by aesop))
#guard ¬(longestGoodSubarray_postcond ([1, 2, 1, 2, 1, 2, 1, 2]) (1) (3) (by aesop))
#guard ¬(longestGoodSubarray_postcond ([1, 2, 1, 2, 1, 2, 1, 2]) (1) (4) (by aesop))
#guard longestGoodSubarray ([1, 2, 1, 2, 1, 2, 1, 2]) (1) (by aesop) = (2)

-- Test case 3
#guard longestGoodSubarray_precond ([5, 5, 5, 5, 5, 5, 5]) (4)
#guard longestGoodSubarray_postcond ([5, 5, 5, 5, 5, 5, 5]) (4) (4) (by aesop)
#guard ¬(longestGoodSubarray_postcond ([5, 5, 5, 5, 5, 5, 5]) (4) (3) (by aesop))
#guard ¬(longestGoodSubarray_postcond ([5, 5, 5, 5, 5, 5, 5]) (4) (5) (by aesop))
#guard ¬(longestGoodSubarray_postcond ([5, 5, 5, 5, 5, 5, 5]) (4) (7) (by aesop))
#guard longestGoodSubarray ([5, 5, 5, 5, 5, 5, 5]) (4) (by aesop) = (4)

-- Test case 4
#guard longestGoodSubarray_precond ([1]) (1)
#guard longestGoodSubarray_postcond ([1]) (1) (1) (by aesop)
#guard ¬(longestGoodSubarray_postcond ([1]) (1) (0) (by aesop))
#guard ¬(longestGoodSubarray_postcond ([1]) (1) (2) (by aesop))
#guard longestGoodSubarray ([1]) (1) (by aesop) = (1)

-- Test case 5
#guard longestGoodSubarray_precond ([2, 2, 1, 1, 3]) (2)
#guard longestGoodSubarray_postcond ([2, 2, 1, 1, 3]) (2) (5) (by aesop)
#guard ¬(longestGoodSubarray_postcond ([2, 2, 1, 1, 3]) (2) (2) (by aesop))
#guard ¬(longestGoodSubarray_postcond ([2, 2, 1, 1, 3]) (2) (3) (by aesop))
#guard ¬(longestGoodSubarray_postcond ([2, 2, 1, 1, 3]) (2) (4) (by aesop))
#guard ¬(longestGoodSubarray_postcond ([2, 2, 1, 1, 3]) (2) (6) (by aesop))
#guard longestGoodSubarray ([2, 2, 1, 1, 3]) (2) (by aesop) = (5)
