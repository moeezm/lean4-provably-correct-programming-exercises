import Aesop

/-
-----Description----- 
This task requires writing a Lean 4 method that finds the smallest number in an
array of integers.

-----Input-----
The input consists of:
s: An array of integers.

-----Output-----
The output is an option integer:
Returns the smallest number found in the input array or none if the array is
empty.

-/

@[reducible, simp]
def findSmallest_precond (s : Array Nat) : Prop := sorry

def findSmallest (s : Array Nat) (h_precond : findSmallest_precond s) : Option Nat := sorry

@[reducible, simp]
def findSmallest_postcond (s : Array Nat) (result : Option Nat) (h_precond : findSmallest_precond s) : Prop := sorry

theorem findSmallest_spec_satisfied (s : Array Nat) (h_precond : findSmallest_precond s) :
    findSmallest_postcond s (findSmallest s h_precond) h_precond := by
  sorry

-- Test Guards

-- Test case 1
#guard findSmallest_precond (#[3, 1, 4, 1, 5, 9, 2, 6, 5, 3, 5])
#guard findSmallest_postcond (#[3, 1, 4, 1, 5, 9, 2, 6, 5, 3, 5]) ("some (1)") (by aesop)
#guard ¬(findSmallest_postcond (#[3, 1, 4, 1, 5, 9, 2, 6, 5, 3, 5]) ("some (2)") (by aesop))
#guard ¬(findSmallest_postcond (#[3, 1, 4, 1, 5, 9, 2, 6, 5, 3, 5]) ("some (0)") (by aesop))
#guard ¬(findSmallest_postcond (#[3, 1, 4, 1, 5, 9, 2, 6, 5, 3, 5]) ("none") (by aesop))
#guard findSmallest (#[3, 1, 4, 1, 5, 9, 2, 6, 5, 3, 5]) (by aesop) = ("some (1)")

-- Test case 2
#guard findSmallest_precond (#[0, 1, 2, 3, 4, 5])
#guard findSmallest_postcond (#[0, 1, 2, 3, 4, 5]) ("some (0)") (by aesop)
#guard ¬(findSmallest_postcond (#[0, 1, 2, 3, 4, 5]) ("some (1)") (by aesop))
#guard ¬(findSmallest_postcond (#[0, 1, 2, 3, 4, 5]) ("none") (by aesop))
#guard findSmallest (#[0, 1, 2, 3, 4, 5]) (by aesop) = ("some (0)")

-- Test case 3
#guard findSmallest_precond (#[1])
#guard findSmallest_postcond (#[1]) ("some (1)") (by aesop)
#guard ¬(findSmallest_postcond (#[1]) ("some (0)") (by aesop))
#guard ¬(findSmallest_postcond (#[1]) ("some (2)") (by aesop))
#guard ¬(findSmallest_postcond (#[1]) ("none") (by aesop))
#guard findSmallest (#[1]) (by aesop) = ("some (1)")

-- Test case 4
#guard findSmallest_precond (#[10, 10, 10])
#guard findSmallest_postcond (#[10, 10, 10]) ("some (10)") (by aesop)
#guard ¬(findSmallest_postcond (#[10, 10, 10]) ("some (9)") (by aesop))
#guard ¬(findSmallest_postcond (#[10, 10, 10]) ("some (0)") (by aesop))
#guard ¬(findSmallest_postcond (#[10, 10, 10]) ("none") (by aesop))
#guard findSmallest (#[10, 10, 10]) (by aesop) = ("some (10)")

-- Test case 5
#guard findSmallest_precond (#[3, 2, 2, 2, 2, 2, 2, 1])
#guard findSmallest_postcond (#[3, 2, 2, 2, 2, 2, 2, 1]) ("some (1)") (by aesop)
#guard ¬(findSmallest_postcond (#[3, 2, 2, 2, 2, 2, 2, 1]) ("some (2)") (by aesop))
#guard ¬(findSmallest_postcond (#[3, 2, 2, 2, 2, 2, 2, 1]) ("some (0)") (by aesop))
#guard ¬(findSmallest_postcond (#[3, 2, 2, 2, 2, 2, 2, 1]) ("none") (by aesop))
#guard findSmallest (#[3, 2, 2, 2, 2, 2, 2, 1]) (by aesop) = ("some (1)")

-- Test case 6
#guard findSmallest_precond (#[0])
#guard findSmallest_postcond (#[0]) ("some (0)") (by aesop)
#guard ¬(findSmallest_postcond (#[0]) ("some (1)") (by aesop))
#guard ¬(findSmallest_postcond (#[0]) ("none") (by aesop))
#guard findSmallest (#[0]) (by aesop) = ("some (0)")

-- Test case 7
#guard findSmallest_precond (#[100, 99, 98])
#guard findSmallest_postcond (#[100, 99, 98]) ("some (98)") (by aesop)
#guard ¬(findSmallest_postcond (#[100, 99, 98]) ("some (99)") (by aesop))
#guard ¬(findSmallest_postcond (#[100, 99, 98]) ("some (97)") (by aesop))
#guard ¬(findSmallest_postcond (#[100, 99, 98]) ("none") (by aesop))
#guard findSmallest (#[100, 99, 98]) (by aesop) = ("some (98)")

-- Test case 8
#guard findSmallest_precond (#[])
#guard findSmallest_postcond (#[]) ("none") (by aesop)
#guard ¬(findSmallest_postcond (#[]) ("some (0)") (by aesop))
#guard findSmallest (#[]) (by aesop) = ("none")
