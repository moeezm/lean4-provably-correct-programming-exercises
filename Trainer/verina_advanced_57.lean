import Aesop

/-
-----Description----- 
This task requires writing a Lean 4 function that finds the next greater
element for a given array of numbers. The next greater element for an element x
is defined as the first element greater than x that appears to the right of x in
the array.

Given two distinct 0-indexed integer arrays `nums1` and `nums2`, where `nums1`
is a subset of `nums2`, the function should determine the next greater element
for each value in `nums1` as it appears in `nums2`.
All integers in both arrays are unique, and the length constraints are.

-----Input-----
The input consists of two lists of integers:
nums1: A list of integers, which is a subset of nums2.
nums2: A list of integers containing all elements from nums1 and possibly
additional elements.

-----Output-----
The output is a list of integers:
- An array of the same length as nums1.
- For each element nums1[i], the corresponding output element is:
  - The next greater element of nums1[i] in nums2 if one exists
  - -1 if there is no next greater element

-/

@[reducible, simp]
def nextGreaterElement_precond (nums1 : List Int) (nums2 : List Int) : Prop := sorry

def nextGreaterElement (nums1 : List Int) (nums2 : List Int) (h_precond : nextGreaterElement_precond nums1 nums2) : List Int := sorry

@[reducible, simp]
def nextGreaterElement_postcond (nums1 : List Int) (nums2 : List Int) (result : List Int) (h_precond : nextGreaterElement_precond nums1 nums2) : Prop := sorry

theorem nextGreaterElement_spec_satisfied (nums1 : List Int) (nums2 : List Int) (h_precond : nextGreaterElement_precond nums1 nums2) :
    nextGreaterElement_postcond nums1 nums2 (nextGreaterElement nums1 nums2 h_precond) h_precond := by
  sorry

-- Test Guards

-- Rejected inputs
#guard ¬(nextGreaterElement_precond ([1, 3]) ([1, 2]))
#guard ¬(nextGreaterElement_precond ([1, 1]) ([1, 2]))

-- Test case 1
#guard nextGreaterElement_precond ([4, 1, 2]) ([1, 3, 4, 2])
#guard nextGreaterElement_postcond ([4, 1, 2]) ([1, 3, 4, 2]) ([-1, 3, -1]) (by aesop)
#guard ¬(nextGreaterElement_postcond ([4, 1, 2]) ([1, 3, 4, 2]) ([3, -1, 3]) (by aesop))
#guard nextGreaterElement ([4, 1, 2]) ([1, 3, 4, 2]) (by aesop) = ([-1, 3, -1])

-- Test case 2
#guard nextGreaterElement_precond ([2, 4]) ([1, 2, 3, 4])
#guard nextGreaterElement_postcond ([2, 4]) ([1, 2, 3, 4]) ([3, -1]) (by aesop)
#guard ¬(nextGreaterElement_postcond ([2, 4]) ([1, 2, 3, 4]) ([-1, 3]) (by aesop))
#guard nextGreaterElement ([2, 4]) ([1, 2, 3, 4]) (by aesop) = ([3, -1])

-- Test case 3
#guard nextGreaterElement_precond ([1]) ([1, 2])
#guard nextGreaterElement_postcond ([1]) ([1, 2]) ([2]) (by aesop)
#guard ¬(nextGreaterElement_postcond ([1]) ([1, 2]) ([-1]) (by aesop))
#guard nextGreaterElement ([1]) ([1, 2]) (by aesop) = ([2])

-- Test case 4
#guard nextGreaterElement_precond ([5]) ([5, 4, 3, 2, 1])
#guard nextGreaterElement_postcond ([5]) ([5, 4, 3, 2, 1]) ([-1]) (by aesop)
#guard ¬(nextGreaterElement_postcond ([5]) ([5, 4, 3, 2, 1]) ([4]) (by aesop))
#guard nextGreaterElement ([5]) ([5, 4, 3, 2, 1]) (by aesop) = ([-1])

-- Test case 5
#guard nextGreaterElement_precond ([1, 3, 5, 2, 4]) ([6, 5, 4, 3, 2, 1])
#guard nextGreaterElement_postcond ([1, 3, 5, 2, 4]) ([6, 5, 4, 3, 2, 1]) ([-1, -1, -1, -1, -1]) (by aesop)
#guard ¬(nextGreaterElement_postcond ([1, 3, 5, 2, 4]) ([6, 5, 4, 3, 2, 1]) ([6, 5, 6, 3, 6]) (by aesop))
#guard nextGreaterElement ([1, 3, 5, 2, 4]) ([6, 5, 4, 3, 2, 1]) (by aesop) = ([-1, -1, -1, -1, -1])

-- Test case 6
#guard nextGreaterElement_precond ([1, 2, 3]) ([3, 2, 1, 4])
#guard nextGreaterElement_postcond ([1, 2, 3]) ([3, 2, 1, 4]) ([4, 4, 4]) (by aesop)
#guard ¬(nextGreaterElement_postcond ([1, 2, 3]) ([3, 2, 1, 4]) ([-1, -1, -1]) (by aesop))
#guard nextGreaterElement ([1, 2, 3]) ([3, 2, 1, 4]) (by aesop) = ([4, 4, 4])

-- Test case 7
#guard nextGreaterElement_precond ([4, 3, 2, 1]) ([4, 3, 2, 1])
#guard nextGreaterElement_postcond ([4, 3, 2, 1]) ([4, 3, 2, 1]) ([-1, -1, -1, -1]) (by aesop)
#guard ¬(nextGreaterElement_postcond ([4, 3, 2, 1]) ([4, 3, 2, 1]) ([3, 2, 1, -1]) (by aesop))
#guard nextGreaterElement ([4, 3, 2, 1]) ([4, 3, 2, 1]) (by aesop) = ([-1, -1, -1, -1])
