import Aesop

/-
-----Description-----  
This task involves determining the first index in an array where a given
condition holds true. The goal is to identify the position of the first element
that meets a specified criterion, ensuring that no preceding element does.

-----Input-----  
The input consists of:  
• a: An array of elements (for testing purposes, you can assume it is an array
of integers).
• P: A predicate function on the elements (represented as a string for test
cases, e.g., "fun x => x > 5"). It is assumed that at least one element in the
array satisfies P.

-----Output-----  
The output is a natural number (Nat) which represents the index of the first
element in the array that satisfies the predicate P.
• The index returned is less than the size of the array.  
• The element at the returned index satisfies P.  
• All elements before the returned index do not satisfy P.

-----Note-----  
It is assumed that the array contains at least one element that satisfies P. In
cases where this precondition does not hold, the behavior of the function is not
guaranteed by the specification.
-/

@[reducible, simp]
def LinearSearch3_precond (a : Array Int) (P : Int -> Bool) : Prop := sorry

def LinearSearch3 (a : Array Int) (P : Int -> Bool) (h_precond : LinearSearch3_precond a P) : Nat := sorry

@[reducible, simp]
def LinearSearch3_postcond (a : Array Int) (P : Int -> Bool) (result : Nat) (h_precond : LinearSearch3_precond a P) : Prop := sorry

theorem LinearSearch3_spec_satisfied (a : Array Int) (P : Int -> Bool) (h_precond : LinearSearch3_precond a P) :
    LinearSearch3_postcond a P (LinearSearch3 a P h_precond) h_precond := by
  sorry

-- Test Guards

-- Rejected inputs
#guard ¬(LinearSearch3_precond (#[1, 2, 3, 4, 5]) ("fun x => x > 10"))

-- Test case 1
#guard LinearSearch3_precond (#[4, 7, 2, 9]) ("fun x => x > 5")
#guard LinearSearch3_postcond (#[4, 7, 2, 9]) ("fun x => x > 5") (1) (by aesop)
#guard ¬(LinearSearch3_postcond (#[4, 7, 2, 9]) ("fun x => x > 5") (0) (by aesop))
#guard ¬(LinearSearch3_postcond (#[4, 7, 2, 9]) ("fun x => x > 5") (2) (by aesop))
#guard ¬(LinearSearch3_postcond (#[4, 7, 2, 9]) ("fun x => x > 5") (3) (by aesop))
#guard LinearSearch3 (#[4, 7, 2, 9]) ("fun x => x > 5") (by aesop) = (1)

-- Test case 2
#guard LinearSearch3_precond (#[10, 8, 6, 4, 2]) ("fun x => x < 5")
#guard LinearSearch3_postcond (#[10, 8, 6, 4, 2]) ("fun x => x < 5") (3) (by aesop)
#guard ¬(LinearSearch3_postcond (#[10, 8, 6, 4, 2]) ("fun x => x < 5") (0) (by aesop))
#guard ¬(LinearSearch3_postcond (#[10, 8, 6, 4, 2]) ("fun x => x < 5") (1) (by aesop))
#guard ¬(LinearSearch3_postcond (#[10, 8, 6, 4, 2]) ("fun x => x < 5") (4) (by aesop))
#guard LinearSearch3 (#[10, 8, 6, 4, 2]) ("fun x => x < 5") (by aesop) = (3)

-- Test case 3
#guard LinearSearch3_precond (#[5, 3, 1, 2]) ("fun x => x == 1")
#guard LinearSearch3_postcond (#[5, 3, 1, 2]) ("fun x => x == 1") (2) (by aesop)
#guard ¬(LinearSearch3_postcond (#[5, 3, 1, 2]) ("fun x => x == 1") (0) (by aesop))
#guard ¬(LinearSearch3_postcond (#[5, 3, 1, 2]) ("fun x => x == 1") (1) (by aesop))
#guard ¬(LinearSearch3_postcond (#[5, 3, 1, 2]) ("fun x => x == 1") (3) (by aesop))
#guard LinearSearch3 (#[5, 3, 1, 2]) ("fun x => x == 1") (by aesop) = (2)

-- Test case 4
#guard LinearSearch3_precond (#[0, 1, 2, 3]) ("fun x => x == 0")
#guard LinearSearch3_postcond (#[0, 1, 2, 3]) ("fun x => x == 0") (0) (by aesop)
#guard ¬(LinearSearch3_postcond (#[0, 1, 2, 3]) ("fun x => x == 0") (1) (by aesop))
#guard ¬(LinearSearch3_postcond (#[0, 1, 2, 3]) ("fun x => x == 0") (2) (by aesop))
#guard ¬(LinearSearch3_postcond (#[0, 1, 2, 3]) ("fun x => x == 0") (3) (by aesop))
#guard LinearSearch3 (#[0, 1, 2, 3]) ("fun x => x == 0") (by aesop) = (0)

-- Test case 5
#guard LinearSearch3_precond (#[9, 9, 9, 9]) ("fun x => x == 9")
#guard LinearSearch3_postcond (#[9, 9, 9, 9]) ("fun x => x == 9") (0) (by aesop)
#guard ¬(LinearSearch3_postcond (#[9, 9, 9, 9]) ("fun x => x == 9") (1) (by aesop))
#guard ¬(LinearSearch3_postcond (#[9, 9, 9, 9]) ("fun x => x == 9") (2) (by aesop))
#guard ¬(LinearSearch3_postcond (#[9, 9, 9, 9]) ("fun x => x == 9") (3) (by aesop))
#guard LinearSearch3 (#[9, 9, 9, 9]) ("fun x => x == 9") (by aesop) = (0)
