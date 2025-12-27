import Aesop

/-
-----Description----- 
This task requires writing a Lean 4 method that checks whether an array of
integers is sorted in non-decreasing order. The method should return true if
every element is less than or equal to the element that follows it, and false
otherwise.

-----Input-----
The input consists of:
a: An array of integers. The array can be empty or have any length.

-----Output-----
The output is a Boolean value:
Returns true if the array is sorted in non-decreasing order.
Returns false if the array is not sorted in non-decreasing order.

-----Note-----
A true result guarantees that for every valid pair of indices i and j (with i <
j), the element at position i is less than or equal to the element at position
j. A false result indicates that there exists at least one adjacent pair of
elements where the first element is greater than the second.
-/

@[reducible, simp]
def isSorted_precond (a : Array Int) : Prop := sorry

def isSorted (a : Array Int) (h_precond : isSorted_precond a) : Bool := sorry

@[reducible, simp]
def isSorted_postcond (a : Array Int) (result : Bool) (h_precond : isSorted_precond a) : Prop := sorry

theorem isSorted_spec_satisfied (a : Array Int) (h_precond : isSorted_precond a) :
    isSorted_postcond a (isSorted a h_precond) h_precond := by
  sorry

-- Test Guards

-- Test case 1
#guard isSorted_precond (#[1, 2, 3, 4, 5])
#guard isSorted_postcond (#[1, 2, 3, 4, 5]) (true) (by aesop)
#guard ¬(isSorted_postcond (#[1, 2, 3, 4, 5]) (false) (by aesop))
#guard isSorted (#[1, 2, 3, 4, 5]) (by aesop) = (true)

-- Test case 2
#guard isSorted_precond (#[5, 4, 3, 2, 1])
#guard isSorted_postcond (#[5, 4, 3, 2, 1]) (false) (by aesop)
#guard ¬(isSorted_postcond (#[5, 4, 3, 2, 1]) (true) (by aesop))
#guard isSorted (#[5, 4, 3, 2, 1]) (by aesop) = (false)

-- Test case 3
#guard isSorted_precond (#[1, 3, 2, 4, 5])
#guard isSorted_postcond (#[1, 3, 2, 4, 5]) (false) (by aesop)
#guard ¬(isSorted_postcond (#[1, 3, 2, 4, 5]) (true) (by aesop))
#guard isSorted (#[1, 3, 2, 4, 5]) (by aesop) = (false)

-- Test case 4
#guard isSorted_precond (#[])
#guard isSorted_postcond (#[]) (true) (by aesop)
#guard ¬(isSorted_postcond (#[]) (false) (by aesop))
#guard isSorted (#[]) (by aesop) = (true)

-- Test case 5
#guard isSorted_precond (#[10])
#guard isSorted_postcond (#[10]) (true) (by aesop)
#guard ¬(isSorted_postcond (#[10]) (false) (by aesop))
#guard isSorted (#[10]) (by aesop) = (true)

-- Test case 6
#guard isSorted_precond (#[2, 2, 2, 2])
#guard isSorted_postcond (#[2, 2, 2, 2]) (true) (by aesop)
#guard ¬(isSorted_postcond (#[2, 2, 2, 2]) (false) (by aesop))
#guard isSorted (#[2, 2, 2, 2]) (by aesop) = (true)

-- Test case 7
#guard isSorted_precond (#[1, 2, 2, 3])
#guard isSorted_postcond (#[1, 2, 2, 3]) (true) (by aesop)
#guard ¬(isSorted_postcond (#[1, 2, 2, 3]) (false) (by aesop))
#guard isSorted (#[1, 2, 2, 3]) (by aesop) = (true)
