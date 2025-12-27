import Aesop

/-
-----Description----- 
This task requires writing a Lean 4 method that determines whether an array of
integers contains at least one pair of consecutive numbers. The method should
return true if there is any index where an element, when increased by one,
equals the next element in the array. If no such consecutive pair exists, the
method should return false.

-----Input-----
The input consists of:
a: An array of integers (the array may be empty or non-empty).

-----Output-----
The output is a Boolean value:
Returns true if there is at least one index where an element plus one equals
the following element.
Returns false if the array does not contain any consecutive numbers.

-----Note-----
There are no additional preconditions; the method will function correctly
regardless of the array's size.
-/

@[reducible, simp]
def containsConsecutiveNumbers_precond (a : Array Int) : Prop := sorry

def containsConsecutiveNumbers (a : Array Int) (h_precond : containsConsecutiveNumbers_precond a) : Bool := sorry

@[reducible, simp]
def containsConsecutiveNumbers_postcond (a : Array Int) (result : Bool) (h_precond : containsConsecutiveNumbers_precond a) : Prop := sorry

theorem containsConsecutiveNumbers_spec_satisfied (a : Array Int) (h_precond : containsConsecutiveNumbers_precond a) :
    containsConsecutiveNumbers_postcond a (containsConsecutiveNumbers a h_precond) h_precond := by
  sorry

-- Test Guards

-- Test case 1
#guard containsConsecutiveNumbers_precond (#[1, 2, 3, 5])
#guard containsConsecutiveNumbers_postcond (#[1, 2, 3, 5]) (true) (by aesop)
#guard ¬(containsConsecutiveNumbers_postcond (#[1, 2, 3, 5]) (false) (by aesop))
#guard containsConsecutiveNumbers (#[1, 2, 3, 5]) (by aesop) = (true)

-- Test case 2
#guard containsConsecutiveNumbers_precond (#[1, 3, 5, 7])
#guard containsConsecutiveNumbers_postcond (#[1, 3, 5, 7]) (false) (by aesop)
#guard ¬(containsConsecutiveNumbers_postcond (#[1, 3, 5, 7]) (true) (by aesop))
#guard containsConsecutiveNumbers (#[1, 3, 5, 7]) (by aesop) = (false)

-- Test case 3
#guard containsConsecutiveNumbers_precond (#[])
#guard containsConsecutiveNumbers_postcond (#[]) (false) (by aesop)
#guard ¬(containsConsecutiveNumbers_postcond (#[]) (true) (by aesop))
#guard containsConsecutiveNumbers (#[]) (by aesop) = (false)

-- Test case 4
#guard containsConsecutiveNumbers_precond (#[10])
#guard containsConsecutiveNumbers_postcond (#[10]) (false) (by aesop)
#guard ¬(containsConsecutiveNumbers_postcond (#[10]) (true) (by aesop))
#guard containsConsecutiveNumbers (#[10]) (by aesop) = (false)

-- Test case 5
#guard containsConsecutiveNumbers_precond (#[5, 6])
#guard containsConsecutiveNumbers_postcond (#[5, 6]) (true) (by aesop)
#guard ¬(containsConsecutiveNumbers_postcond (#[5, 6]) (false) (by aesop))
#guard containsConsecutiveNumbers (#[5, 6]) (by aesop) = (true)

-- Test case 6
#guard containsConsecutiveNumbers_precond (#[5, 7, 8, 10])
#guard containsConsecutiveNumbers_postcond (#[5, 7, 8, 10]) (true) (by aesop)
#guard ¬(containsConsecutiveNumbers_postcond (#[5, 7, 8, 10]) (false) (by aesop))
#guard containsConsecutiveNumbers (#[5, 7, 8, 10]) (by aesop) = (true)

-- Test case 7
#guard containsConsecutiveNumbers_precond (#[9, 9, 10])
#guard containsConsecutiveNumbers_postcond (#[9, 9, 10]) (true) (by aesop)
#guard ¬(containsConsecutiveNumbers_postcond (#[9, 9, 10]) (false) (by aesop))
#guard containsConsecutiveNumbers (#[9, 9, 10]) (by aesop) = (true)

-- Test case 8
#guard containsConsecutiveNumbers_precond (#[3, 3, 3])
#guard containsConsecutiveNumbers_postcond (#[3, 3, 3]) (false) (by aesop)
#guard ¬(containsConsecutiveNumbers_postcond (#[3, 3, 3]) (true) (by aesop))
#guard containsConsecutiveNumbers (#[3, 3, 3]) (by aesop) = (false)
