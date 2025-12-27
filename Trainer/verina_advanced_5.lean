import Aesop

/-
-----Description----- 
This task requires writing a Lean 4 method that adds two non-empty linked lists
representing non-negative integers.
The digits are stored in reverse order (i.e., the first element is the least
significant digit).
Each node (list element) holds a single digit (ranging from 0 to 9). The
function should add the two numbers and return the sum
as a linked list, also in reverse order.

-----Input-----
The input consists of:
- l1: A list of natural numbers representing the digits of the first number in
reverse order.
- l2: A list of natural numbers representing the digits of the second number in
reverse order.

-----Output-----
The output is a list of natural numbers:
Returns a list of digits (in reverse order) representing the sum of the two
input numbers.


-/

@[reducible, simp]
def addTwoNumbers_precond (l1 : List Nat) (l2 : List Nat) : Prop := sorry

def addTwoNumbers (l1 : List Nat) (l2 : List Nat) (h_precond : addTwoNumbers_precond l1 l2) : List Nat := sorry

@[reducible, simp]
def addTwoNumbers_postcond (l1 : List Nat) (l2 : List Nat) (result : List Nat) (h_precond : addTwoNumbers_precond l1 l2) : Prop := sorry

theorem addTwoNumbers_spec_satisfied (l1 : List Nat) (l2 : List Nat) (h_precond : addTwoNumbers_precond l1 l2) :
    addTwoNumbers_postcond l1 l2 (addTwoNumbers l1 l2 h_precond) h_precond := by
  sorry

-- Test Guards

-- Rejected inputs
#guard ¬(addTwoNumbers_precond ([]) ([]))
#guard ¬(addTwoNumbers_precond ([0, 0]) ([0, 0]))

-- Test case 1
#guard addTwoNumbers_precond ([2,4,3]) ([5,6,4])
#guard addTwoNumbers_postcond ([2,4,3]) ([5,6,4]) ([7,0,8]) (by aesop)
#guard ¬(addTwoNumbers_postcond ([2,4,3]) ([5,6,4]) ([2,4,3]) (by aesop))
#guard ¬(addTwoNumbers_postcond ([2,4,3]) ([5,6,4]) ([0]) (by aesop))
#guard addTwoNumbers ([2,4,3]) ([5,6,4]) (by aesop) = ([7,0,8])

-- Test case 2
#guard addTwoNumbers_precond ([0]) ([0])
#guard addTwoNumbers_postcond ([0]) ([0]) ([0]) (by aesop)
#guard ¬(addTwoNumbers_postcond ([0]) ([0]) ([0,0]) (by aesop))
#guard addTwoNumbers ([0]) ([0]) (by aesop) = ([0])

-- Test case 3
#guard addTwoNumbers_precond ([9,9,9,9,9,9,9]) ([9,9,9,9])
#guard addTwoNumbers_postcond ([9,9,9,9,9,9,9]) ([9,9,9,9]) ([8,9,9,9,0,0,0,1]) (by aesop)
#guard ¬(addTwoNumbers_postcond ([9,9,9,9,9,9,9]) ([9,9,9,9]) ([9,9,9,9,9,9,9,9]) (by aesop))
#guard addTwoNumbers ([9,9,9,9,9,9,9]) ([9,9,9,9]) (by aesop) = ([8,9,9,9,0,0,0,1])

-- Test case 4
#guard addTwoNumbers_precond ([1,2,3]) ([4,5])
#guard addTwoNumbers_postcond ([1,2,3]) ([4,5]) ([5,7,3]) (by aesop)
#guard ¬(addTwoNumbers_postcond ([1,2,3]) ([4,5]) ([5,7]) (by aesop))
#guard ¬(addTwoNumbers_postcond ([1,2,3]) ([4,5]) ([5,7,4]) (by aesop))
#guard addTwoNumbers ([1,2,3]) ([4,5]) (by aesop) = ([5,7,3])
