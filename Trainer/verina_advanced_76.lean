import Aesop

/-
-----Description-----
This task requires writing a Lean 4 method that returns the k most frequent
elements from a list of integers. The method should count the frequency of each
distinct element in the list and return the k elements with the highest
frequency.

-----Input-----
The input consists of two values:
nums: A list of integers, possibly with duplicates.
k: A natural number indicating how many of the most frequent elements to
return. Assimng k <= # of distinct elements in nums.

-----Output-----
The output is a list of integers:
Returns exactly k integers representing the elements that appear most
frequently in the input list in the order form the higher frequency to lower
frequency.
If two numbers have the same frequency, use the order of the first occurance in
nums.

-/

@[reducible, simp]
def topKFrequent_precond (nums : List Int) (k : Nat) : Prop := sorry

def topKFrequent (nums : List Int) (k : Nat) (h_precond : topKFrequent_precond nums k) : List Int := sorry

@[reducible, simp]
def topKFrequent_postcond (nums : List Int) (k : Nat) (result : List Int) (h_precond : topKFrequent_precond nums k) : Prop := sorry

theorem topKFrequent_spec_satisfied (nums : List Int) (k : Nat) (h_precond : topKFrequent_precond nums k) :
    topKFrequent_postcond nums k (topKFrequent nums k h_precond) h_precond := by
  sorry

-- Test Guards

-- Rejected inputs
#guard ¬(topKFrequent_precond ([1, 2, 3]) (4))

-- Test case 1
#guard topKFrequent_precond ([1, 1, 1, 2, 2, 3]) (2)
#guard topKFrequent_postcond ([1, 1, 1, 2, 2, 3]) (2) ([1, 2]) (by aesop)
#guard ¬(topKFrequent_postcond ([1, 1, 1, 2, 2, 3]) (2) ([1, 3]) (by aesop))
#guard ¬(topKFrequent_postcond ([1, 1, 1, 2, 2, 3]) (2) ([2, 3]) (by aesop))
#guard topKFrequent ([1, 1, 1, 2, 2, 3]) (2) (by aesop) = ([1, 2])

-- Test case 2
#guard topKFrequent_precond ([4, 1, -1, 2, -1, 2, 3]) (2)
#guard topKFrequent_postcond ([4, 1, -1, 2, -1, 2, 3]) (2) ([-1, 2]) (by aesop)
#guard ¬(topKFrequent_postcond ([4, 1, -1, 2, -1, 2, 3]) (2) ([-1, 4]) (by aesop))
#guard ¬(topKFrequent_postcond ([4, 1, -1, 2, -1, 2, 3]) (2) ([4, 3]) (by aesop))
#guard topKFrequent ([4, 1, -1, 2, -1, 2, 3]) (2) (by aesop) = ([-1, 2])

-- Test case 3
#guard topKFrequent_precond ([5]) (1)
#guard topKFrequent_postcond ([5]) (1) ([5]) (by aesop)
#guard ¬(topKFrequent_postcond ([5]) (1) ([]) (by aesop))
#guard topKFrequent ([5]) (1) (by aesop) = ([5])

-- Test case 4
#guard topKFrequent_precond ([7, 7, 7, 8, 8, 9]) (1)
#guard topKFrequent_postcond ([7, 7, 7, 8, 8, 9]) (1) ([7]) (by aesop)
#guard ¬(topKFrequent_postcond ([7, 7, 7, 8, 8, 9]) (1) ([8]) (by aesop))
#guard topKFrequent ([7, 7, 7, 8, 8, 9]) (1) (by aesop) = ([7])

-- Test case 5
#guard topKFrequent_precond ([]) (0)
#guard topKFrequent_postcond ([]) (0) ([]) (by aesop)
#guard ¬(topKFrequent_postcond ([]) (0) ([0]) (by aesop))
#guard topKFrequent ([]) (0) (by aesop) = ([])
