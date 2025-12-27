import Aesop

/-
-----Description-----
This task requires writing a Lean 4 function that finds the majority element in
a list of integers. The majority element is the element that appears more than
⌊n/2⌋ times, where n is the list’s length. You may assume that a majority
element always exists in the input.

-----Input-----
- nums: A list of integers of length ≥ 1, containing a majority element.

-----Output-----
- An integer: the element that appears more than ⌊n/2⌋ times.


-/

@[reducible, simp]
def majorityElement_precond (nums : List Int) : Prop := sorry

def majorityElement (nums : List Int) (h_precond : majorityElement_precond nums) : Int := sorry

@[reducible, simp]
def majorityElement_postcond (nums : List Int) (result : Int) (h_precond : majorityElement_precond nums) : Prop := sorry

theorem majorityElement_spec_satisfied (nums : List Int) (h_precond : majorityElement_precond nums) :
    majorityElement_postcond nums (majorityElement nums h_precond) h_precond := by
  sorry

-- Test Guards

-- Rejected inputs
#guard ¬(majorityElement_precond ([1, 2, 3]))
#guard ¬(majorityElement_precond ([]))

-- Test case 1
#guard majorityElement_precond ([3, 2, 3])
#guard majorityElement_postcond ([3, 2, 3]) (3) (by aesop)
#guard ¬(majorityElement_postcond ([3, 2, 3]) (2) (by aesop))
#guard majorityElement ([3, 2, 3]) (by aesop) = (3)

-- Test case 2
#guard majorityElement_precond ([2, 2, 1, 1, 1, 2, 2])
#guard majorityElement_postcond ([2, 2, 1, 1, 1, 2, 2]) (2) (by aesop)
#guard ¬(majorityElement_postcond ([2, 2, 1, 1, 1, 2, 2]) (1) (by aesop))
#guard majorityElement ([2, 2, 1, 1, 1, 2, 2]) (by aesop) = (2)

-- Test case 3
#guard majorityElement_precond ([1, 1, 1, 2, 3, 1])
#guard majorityElement_postcond ([1, 1, 1, 2, 3, 1]) (1) (by aesop)
#guard ¬(majorityElement_postcond ([1, 1, 1, 2, 3, 1]) (2) (by aesop))
#guard ¬(majorityElement_postcond ([1, 1, 1, 2, 3, 1]) (3) (by aesop))
#guard majorityElement ([1, 1, 1, 2, 3, 1]) (by aesop) = (1)

-- Test case 4
#guard majorityElement_precond ([0, 0, 0, 0])
#guard majorityElement_postcond ([0, 0, 0, 0]) (0) (by aesop)
#guard ¬(majorityElement_postcond ([0, 0, 0, 0]) (1) (by aesop))
#guard majorityElement ([0, 0, 0, 0]) (by aesop) = (0)

-- Test case 5
#guard majorityElement_precond ([7])
#guard majorityElement_postcond ([7]) (7) (by aesop)
#guard majorityElement ([7]) (by aesop) = (7)
