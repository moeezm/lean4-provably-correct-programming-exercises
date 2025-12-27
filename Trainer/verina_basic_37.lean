import Aesop

/-
-----Description-----  
This task requires writing a Lean 4 method that locates the first occurrence of
a specified integer within a sorted array of integers. The method returns the
index corresponding to the first time the target value appears in the array; if
the target is absent, it returns -1. It is also essential that the original
array remains unchanged.

-----Input-----  
The input consists of:  
• arr: An array of integers sorted in non-decreasing order.  
• target: An integer representing the value to search for.

-----Output-----  
The output is an integer:  
• If the target is found, the method returns the index of its first occurrence.
• If the target is not found, the method returns -1.

-----Note-----  
• The input array must be sorted in non-decreasing order.  
• The array is guaranteed to remain unmodified after the method executes.
-/

@[reducible, simp]
def findFirstOccurrence_precond (arr : Array Int) (target : Int) : Prop := sorry

def findFirstOccurrence (arr : Array Int) (target : Int) (h_precond : findFirstOccurrence_precond arr target) : Int := sorry

@[reducible, simp]
def findFirstOccurrence_postcond (arr : Array Int) (target : Int) (result : Int) (h_precond : findFirstOccurrence_precond arr target) : Prop := sorry

theorem findFirstOccurrence_spec_satisfied (arr : Array Int) (target : Int) (h_precond : findFirstOccurrence_precond arr target) :
    findFirstOccurrence_postcond arr target (findFirstOccurrence arr target h_precond) h_precond := by
  sorry

-- Test Guards

-- Rejected inputs
#guard ¬(findFirstOccurrence_precond (#[3, 2, 1]) (2))

-- Test case 1
#guard findFirstOccurrence_precond (#[1, 2, 2, 3, 4, 5]) (2)
#guard findFirstOccurrence_postcond (#[1, 2, 2, 3, 4, 5]) (2) (1) (by aesop)
#guard ¬(findFirstOccurrence_postcond (#[1, 2, 2, 3, 4, 5]) (2) (0) (by aesop))
#guard ¬(findFirstOccurrence_postcond (#[1, 2, 2, 3, 4, 5]) (2) (2) (by aesop))
#guard ¬(findFirstOccurrence_postcond (#[1, 2, 2, 3, 4, 5]) (2) (-1) (by aesop))
#guard findFirstOccurrence (#[1, 2, 2, 3, 4, 5]) (2) (by aesop) = (1)

-- Test case 2
#guard findFirstOccurrence_precond (#[1, 2, 2, 3, 4, 5]) (6)
#guard findFirstOccurrence_postcond (#[1, 2, 2, 3, 4, 5]) (6) (-1) (by aesop)
#guard ¬(findFirstOccurrence_postcond (#[1, 2, 2, 3, 4, 5]) (6) (0) (by aesop))
#guard ¬(findFirstOccurrence_postcond (#[1, 2, 2, 3, 4, 5]) (6) (1) (by aesop))
#guard ¬(findFirstOccurrence_postcond (#[1, 2, 2, 3, 4, 5]) (6) (2) (by aesop))
#guard findFirstOccurrence (#[1, 2, 2, 3, 4, 5]) (6) (by aesop) = (-1)

-- Test case 3
#guard findFirstOccurrence_precond (#[1, 2, 3, 4, 5]) (1)
#guard findFirstOccurrence_postcond (#[1, 2, 3, 4, 5]) (1) (0) (by aesop)
#guard ¬(findFirstOccurrence_postcond (#[1, 2, 3, 4, 5]) (1) (1) (by aesop))
#guard ¬(findFirstOccurrence_postcond (#[1, 2, 3, 4, 5]) (1) (-1) (by aesop))
#guard ¬(findFirstOccurrence_postcond (#[1, 2, 3, 4, 5]) (1) (2) (by aesop))
#guard findFirstOccurrence (#[1, 2, 3, 4, 5]) (1) (by aesop) = (0)

-- Test case 4
#guard findFirstOccurrence_precond (#[1, 2, 3, 4, 5]) (5)
#guard findFirstOccurrence_postcond (#[1, 2, 3, 4, 5]) (5) (4) (by aesop)
#guard ¬(findFirstOccurrence_postcond (#[1, 2, 3, 4, 5]) (5) (3) (by aesop))
#guard ¬(findFirstOccurrence_postcond (#[1, 2, 3, 4, 5]) (5) (5) (by aesop))
#guard ¬(findFirstOccurrence_postcond (#[1, 2, 3, 4, 5]) (5) (0) (by aesop))
#guard findFirstOccurrence (#[1, 2, 3, 4, 5]) (5) (by aesop) = (4)

-- Test case 5
#guard findFirstOccurrence_precond (#[1, 2, 3, 4, 5]) (0)
#guard findFirstOccurrence_postcond (#[1, 2, 3, 4, 5]) (0) (-1) (by aesop)
#guard ¬(findFirstOccurrence_postcond (#[1, 2, 3, 4, 5]) (0) (0) (by aesop))
#guard ¬(findFirstOccurrence_postcond (#[1, 2, 3, 4, 5]) (0) (1) (by aesop))
#guard ¬(findFirstOccurrence_postcond (#[1, 2, 3, 4, 5]) (0) (2) (by aesop))
#guard findFirstOccurrence (#[1, 2, 3, 4, 5]) (0) (by aesop) = (-1)
