import Aesop

/-
-----Description----- 
This task requires writing a Lean 4 method that checks whether two arrays of
integers have any elements in common. In other words, the method should return
true if there is at least one element that appears in both arrays, and false if
no such element exists.

-----Input-----
The input consists of:
a: An array of integers.
b: An array of integers.

-----Output-----
The output is a Boolean value:
Returns true if there is at least one common element between the two arrays.
Returns false if there are no common elements shared by the arrays.

-----Note-----
Both arrays are assumed to be non-null.
-/

@[reducible, simp]
def hasCommonElement_precond (a : Array Int) (b : Array Int) : Prop := sorry

def hasCommonElement (a : Array Int) (b : Array Int) (h_precond : hasCommonElement_precond a b) : Bool := sorry

@[reducible, simp]
def hasCommonElement_postcond (a : Array Int) (b : Array Int) (result : Bool) (h_precond : hasCommonElement_precond a b) : Prop := sorry

theorem hasCommonElement_spec_satisfied (a : Array Int) (b : Array Int) (h_precond : hasCommonElement_precond a b) :
    hasCommonElement_postcond a b (hasCommonElement a b h_precond) h_precond := by
  sorry

-- Test Guards

-- Rejected inputs
#guard ¬(hasCommonElement_precond (#[]) (#[]))

-- Test case 1
#guard hasCommonElement_precond (#[1, 2, 3]) (#[4, 5, 6])
#guard hasCommonElement_postcond (#[1, 2, 3]) (#[4, 5, 6]) (false) (by aesop)
#guard ¬(hasCommonElement_postcond (#[1, 2, 3]) (#[4, 5, 6]) (true) (by aesop))
#guard hasCommonElement (#[1, 2, 3]) (#[4, 5, 6]) (by aesop) = (false)

-- Test case 2
#guard hasCommonElement_precond (#[1, 2, 3]) (#[3, 4, 5])
#guard hasCommonElement_postcond (#[1, 2, 3]) (#[3, 4, 5]) (true) (by aesop)
#guard ¬(hasCommonElement_postcond (#[1, 2, 3]) (#[3, 4, 5]) (false) (by aesop))
#guard hasCommonElement (#[1, 2, 3]) (#[3, 4, 5]) (by aesop) = (true)

-- Test case 3
#guard hasCommonElement_precond (#[7, 8, 9]) (#[10, 11, 7])
#guard hasCommonElement_postcond (#[7, 8, 9]) (#[10, 11, 7]) (true) (by aesop)
#guard ¬(hasCommonElement_postcond (#[7, 8, 9]) (#[10, 11, 7]) (false) (by aesop))
#guard hasCommonElement (#[7, 8, 9]) (#[10, 11, 7]) (by aesop) = (true)

-- Test case 4
#guard hasCommonElement_precond (#[1, 2, 3, 4]) (#[5, 6, 7, 8])
#guard hasCommonElement_postcond (#[1, 2, 3, 4]) (#[5, 6, 7, 8]) (false) (by aesop)
#guard ¬(hasCommonElement_postcond (#[1, 2, 3, 4]) (#[5, 6, 7, 8]) (true) (by aesop))
#guard hasCommonElement (#[1, 2, 3, 4]) (#[5, 6, 7, 8]) (by aesop) = (false)

-- Test case 5
#guard hasCommonElement_precond (#[1, 2, 3, 4]) (#[4, 5, 6])
#guard hasCommonElement_postcond (#[1, 2, 3, 4]) (#[4, 5, 6]) (true) (by aesop)
#guard ¬(hasCommonElement_postcond (#[1, 2, 3, 4]) (#[4, 5, 6]) (false) (by aesop))
#guard hasCommonElement (#[1, 2, 3, 4]) (#[4, 5, 6]) (by aesop) = (true)

-- Test case 6
#guard hasCommonElement_precond (#[1, 1, 1]) (#[1, 2, 1])
#guard hasCommonElement_postcond (#[1, 1, 1]) (#[1, 2, 1]) (true) (by aesop)
#guard ¬(hasCommonElement_postcond (#[1, 1, 1]) (#[1, 2, 1]) (false) (by aesop))
#guard hasCommonElement (#[1, 1, 1]) (#[1, 2, 1]) (by aesop) = (true)

-- Test case 7
#guard hasCommonElement_precond (#[0]) (#[0])
#guard hasCommonElement_postcond (#[0]) (#[0]) (true) (by aesop)
#guard ¬(hasCommonElement_postcond (#[0]) (#[0]) (false) (by aesop))
#guard hasCommonElement (#[0]) (#[0]) (by aesop) = (true)

-- Test case 8
#guard hasCommonElement_precond (#[0]) (#[-1, 1])
#guard hasCommonElement_postcond (#[0]) (#[-1, 1]) (false) (by aesop)
#guard ¬(hasCommonElement_postcond (#[0]) (#[-1, 1]) (true) (by aesop))
#guard hasCommonElement (#[0]) (#[-1, 1]) (by aesop) = (false)
