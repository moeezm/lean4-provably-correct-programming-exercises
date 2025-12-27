import Aesop

/-
-----Description-----  
This problem involves determining the index of the first occurrence of a
specified element within an array of integers. The objective is to identify the
correct position where the target element appears for the first time, ensuring
that all elements prior to that index are different from the target.

-----Input-----  
The input consists of:  
• a: An array of integers.  
• e: An integer representing the element to search for.

-----Output-----  
The output is a natural number (Nat) representing the index of the first
occurrence of e in the array.
• If the element e exists in the array, the index n will satisfy the conditions
specified above.

-----Note-----  
It is assumed that the input satisfies the precondition where at least one
index i in a exists such that a[i]! = e.
The implementation uses a helper function to iterate through the array
recursively.
-/

@[reducible, simp]
def LinearSearch_precond (a : Array Int) (e : Int) : Prop := sorry

def LinearSearch (a : Array Int) (e : Int) (h_precond : LinearSearch_precond a e) : Nat := sorry

@[reducible, simp]
def LinearSearch_postcond (a : Array Int) (e : Int) (result : Nat) (h_precond : LinearSearch_precond a e) : Prop := sorry

theorem LinearSearch_spec_satisfied (a : Array Int) (e : Int) (h_precond : LinearSearch_precond a e) :
    LinearSearch_postcond a e (LinearSearch a e h_precond) h_precond := by
  sorry

-- Test Guards

-- Rejected inputs
#guard ¬(LinearSearch_precond (#[1, 2, 3, 4, 5]) (6))

-- Test case 1
#guard LinearSearch_precond (#[1, 2, 3, 4, 5]) (3)
#guard LinearSearch_postcond (#[1, 2, 3, 4, 5]) (3) (2) (by aesop)
#guard ¬(LinearSearch_postcond (#[1, 2, 3, 4, 5]) (3) (0) (by aesop))
#guard ¬(LinearSearch_postcond (#[1, 2, 3, 4, 5]) (3) (1) (by aesop))
#guard ¬(LinearSearch_postcond (#[1, 2, 3, 4, 5]) (3) (3) (by aesop))
#guard LinearSearch (#[1, 2, 3, 4, 5]) (3) (by aesop) = (2)

-- Test case 2
#guard LinearSearch_precond (#[10, 20, 30, 40, 50]) (10)
#guard LinearSearch_postcond (#[10, 20, 30, 40, 50]) (10) (0) (by aesop)
#guard ¬(LinearSearch_postcond (#[10, 20, 30, 40, 50]) (10) (1) (by aesop))
#guard ¬(LinearSearch_postcond (#[10, 20, 30, 40, 50]) (10) (2) (by aesop))
#guard ¬(LinearSearch_postcond (#[10, 20, 30, 40, 50]) (10) (3) (by aesop))
#guard LinearSearch (#[10, 20, 30, 40, 50]) (10) (by aesop) = (0)

-- Test case 3
#guard LinearSearch_precond (#[5, 4, 3, 2, 1]) (1)
#guard LinearSearch_postcond (#[5, 4, 3, 2, 1]) (1) (4) (by aesop)
#guard ¬(LinearSearch_postcond (#[5, 4, 3, 2, 1]) (1) (0) (by aesop))
#guard ¬(LinearSearch_postcond (#[5, 4, 3, 2, 1]) (1) (1) (by aesop))
#guard ¬(LinearSearch_postcond (#[5, 4, 3, 2, 1]) (1) (2) (by aesop))
#guard LinearSearch (#[5, 4, 3, 2, 1]) (1) (by aesop) = (4)

-- Test case 4
#guard LinearSearch_precond (#[-1, 0, 1, 2]) (-1)
#guard LinearSearch_postcond (#[-1, 0, 1, 2]) (-1) (0) (by aesop)
#guard ¬(LinearSearch_postcond (#[-1, 0, 1, 2]) (-1) (1) (by aesop))
#guard ¬(LinearSearch_postcond (#[-1, 0, 1, 2]) (-1) (2) (by aesop))
#guard ¬(LinearSearch_postcond (#[-1, 0, 1, 2]) (-1) (3) (by aesop))
#guard LinearSearch (#[-1, 0, 1, 2]) (-1) (by aesop) = (0)

-- Test case 5
#guard LinearSearch_precond (#[7, 8, 7, 9, 7]) (7)
#guard LinearSearch_postcond (#[7, 8, 7, 9, 7]) (7) (0) (by aesop)
#guard ¬(LinearSearch_postcond (#[7, 8, 7, 9, 7]) (7) (2) (by aesop))
#guard ¬(LinearSearch_postcond (#[7, 8, 7, 9, 7]) (7) (3) (by aesop))
#guard ¬(LinearSearch_postcond (#[7, 8, 7, 9, 7]) (7) (4) (by aesop))
#guard LinearSearch (#[7, 8, 7, 9, 7]) (7) (by aesop) = (0)
