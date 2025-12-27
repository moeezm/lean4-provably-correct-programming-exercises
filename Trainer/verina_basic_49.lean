import Aesop

/-
-----Description----- 
This task requires writing a Lean 4 method that searches an array of integers
to locate the first odd number. The method should return a pair where the first
element is a Boolean indicating whether an odd number was found, and the second
element is the index of that odd number if found, or -1 if no odd number exists.
When an odd number is found, the method should return the smallest index at
which an odd number occurs.

-----Input-----
The input consists of:
a: An array of integers.

-----Output-----
The output is a pair (Bool, Int):
- If the Boolean is true, then the integer represents the smallest index of an
odd number in the array.
- If the Boolean is false, then there are no odd numbers in the array, and the
accompanying integer is -1.

-----Note-----
- The input array is assumed to be non-null.
- If multiple odd numbers are present, the index returned should correspond to
the first occurrence.
-/

@[reducible, simp]
def findFirstOdd_precond (a : Array Int) : Prop := sorry

def findFirstOdd (a : Array Int) (h_precond : findFirstOdd_precond a) : Option Nat := sorry

@[reducible, simp]
def findFirstOdd_postcond (a : Array Int) (result : Option Nat) (h_precond : findFirstOdd_precond a) : Prop := sorry

theorem findFirstOdd_spec_satisfied (a : Array Int) (h_precond : findFirstOdd_precond a) :
    findFirstOdd_postcond a (findFirstOdd a h_precond) h_precond := by
  sorry

-- Test Guards

-- Rejected inputs
#guard ¬(findFirstOdd_precond (#[]))

-- Test case 1
#guard findFirstOdd_precond (#[2, 4, 6, 8])
#guard findFirstOdd_postcond (#[2, 4, 6, 8]) ("none") (by aesop)
#guard ¬(findFirstOdd_postcond (#[2, 4, 6, 8]) ("some (0)") (by aesop))
#guard findFirstOdd (#[2, 4, 6, 8]) (by aesop) = ("none")

-- Test case 2
#guard findFirstOdd_precond (#[3, 4, 6, 8])
#guard findFirstOdd_postcond (#[3, 4, 6, 8]) ("some (0)") (by aesop)
#guard ¬(findFirstOdd_postcond (#[3, 4, 6, 8]) ("some (1)") (by aesop))
#guard ¬(findFirstOdd_postcond (#[3, 4, 6, 8]) ("some (2)") (by aesop))
#guard ¬(findFirstOdd_postcond (#[3, 4, 6, 8]) ("none") (by aesop))
#guard findFirstOdd (#[3, 4, 6, 8]) (by aesop) = ("some (0)")

-- Test case 3
#guard findFirstOdd_precond (#[2, 4, 5, 8])
#guard findFirstOdd_postcond (#[2, 4, 5, 8]) ("some (2)") (by aesop)
#guard ¬(findFirstOdd_postcond (#[2, 4, 5, 8]) ("some (0)") (by aesop))
#guard ¬(findFirstOdd_postcond (#[2, 4, 5, 8]) ("some (1)") (by aesop))
#guard ¬(findFirstOdd_postcond (#[2, 4, 5, 8]) ("some (3)") (by aesop))
#guard ¬(findFirstOdd_postcond (#[2, 4, 5, 8]) ("none") (by aesop))
#guard findFirstOdd (#[2, 4, 5, 8]) (by aesop) = ("some (2)")

-- Test case 4
#guard findFirstOdd_precond (#[7])
#guard findFirstOdd_postcond (#[7]) ("some (0)") (by aesop)
#guard ¬(findFirstOdd_postcond (#[7]) ("some (1)") (by aesop))
#guard ¬(findFirstOdd_postcond (#[7]) ("none") (by aesop))
#guard findFirstOdd (#[7]) (by aesop) = ("some (0)")

-- Test case 5
#guard findFirstOdd_precond (#[2])
#guard findFirstOdd_postcond (#[2]) ("none") (by aesop)
#guard ¬(findFirstOdd_postcond (#[2]) ("some (0)") (by aesop))
#guard findFirstOdd (#[2]) (by aesop) = ("none")

-- Test case 6
#guard findFirstOdd_precond (#[1, 2, 3])
#guard findFirstOdd_postcond (#[1, 2, 3]) ("some (0)") (by aesop)
#guard ¬(findFirstOdd_postcond (#[1, 2, 3]) ("some (1)") (by aesop))
#guard ¬(findFirstOdd_postcond (#[1, 2, 3]) ("some (2)") (by aesop))
#guard ¬(findFirstOdd_postcond (#[1, 2, 3]) ("none") (by aesop))
#guard findFirstOdd (#[1, 2, 3]) (by aesop) = ("some (0)")
