import Aesop

/-
-----Description-----  
This task requires writing a Lean 4 method that removes an element from a given
array of integers at a specified index. The resulting array should contain all
the original elements except for the one at the given index. Elements before the
removed element remain unchanged, and elements after it are shifted one position
to the left.

-----Input-----  
The input consists of:  
• s: An array of integers.  
• k: A natural number representing the index of the element to remove
(0-indexed).

-----Output-----  
The output is an array of integers that:  
• Has a length one less than the input array.  
• Contains the same elements as the input array, except that the element at
index k is omitted.
• Preserves the original order with elements after the removed element shifted
left by one position.

-----Note-----  
It is assumed that k is a valid index (0 ≤ k < the length of the array).
-/

@[reducible, simp]
def removeElement_precond (s : Array Int) (k : Nat) : Prop := sorry

def removeElement (s : Array Int) (k : Nat) (h_precond : removeElement_precond s k) : Array Int := sorry

@[reducible, simp]
def removeElement_postcond (s : Array Int) (k : Nat) (result : Array Int) (h_precond : removeElement_precond s k) : Prop := sorry

theorem removeElement_spec_satisfied (s : Array Int) (k : Nat) (h_precond : removeElement_precond s k) :
    removeElement_postcond s k (removeElement s k h_precond) h_precond := by
  sorry

-- Test Guards

-- Rejected inputs
#guard ¬(removeElement_precond (#[1]) (2))

-- Test case 1
#guard removeElement_precond (#[1, 2, 3, 4, 5]) (2)
#guard removeElement_postcond (#[1, 2, 3, 4, 5]) (2) (#[1, 2, 4, 5]) (by aesop)
#guard ¬(removeElement_postcond (#[1, 2, 3, 4, 5]) (2) (#[1, 2, 3, 5]) (by aesop))
#guard ¬(removeElement_postcond (#[1, 2, 3, 4, 5]) (2) (#[1, 3, 4, 5]) (by aesop))
#guard ¬(removeElement_postcond (#[1, 2, 3, 4, 5]) (2) (#[2, 3, 4, 5]) (by aesop))
#guard removeElement (#[1, 2, 3, 4, 5]) (2) (by aesop) = (#[1, 2, 4, 5])

-- Test case 2
#guard removeElement_precond (#[10, 20, 30, 40]) (0)
#guard removeElement_postcond (#[10, 20, 30, 40]) (0) (#[20, 30, 40]) (by aesop)
#guard ¬(removeElement_postcond (#[10, 20, 30, 40]) (0) (#[10, 30, 40]) (by aesop))
#guard ¬(removeElement_postcond (#[10, 20, 30, 40]) (0) (#[10, 20, 30, 40]) (by aesop))
#guard ¬(removeElement_postcond (#[10, 20, 30, 40]) (0) (#[20, 30, 40, 0]) (by aesop))
#guard removeElement (#[10, 20, 30, 40]) (0) (by aesop) = (#[20, 30, 40])

-- Test case 3
#guard removeElement_precond (#[10, 20, 30, 40]) (3)
#guard removeElement_postcond (#[10, 20, 30, 40]) (3) (#[10, 20, 30]) (by aesop)
#guard ¬(removeElement_postcond (#[10, 20, 30, 40]) (3) (#[20, 30, 40]) (by aesop))
#guard ¬(removeElement_postcond (#[10, 20, 30, 40]) (3) (#[10, 20, 40]) (by aesop))
#guard ¬(removeElement_postcond (#[10, 20, 30, 40]) (3) (#[10, 30, 40]) (by aesop))
#guard removeElement (#[10, 20, 30, 40]) (3) (by aesop) = (#[10, 20, 30])

-- Test case 4
#guard removeElement_precond (#[7]) (0)
#guard removeElement_postcond (#[7]) (0) (#[]) (by aesop)
#guard ¬(removeElement_postcond (#[7]) (0) (#[7]) (by aesop))
#guard ¬(removeElement_postcond (#[7]) (0) (#[0]) (by aesop))
#guard removeElement (#[7]) (0) (by aesop) = (#[])
