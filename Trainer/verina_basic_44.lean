import Aesop

/-
-----Description----- 
This task requires writing a Lean 4 method that verifies if every odd index in
an array of integers holds an odd number. In other words, for each index in the
array that is odd, the number located at that index must also be odd. The method
should return true if this condition is satisfied for every odd index;
otherwise, it should return false.

-----Input-----
The input consists of:
a: An array of integers.

-----Output-----
The output is a Boolean value:
Returns true if, for every odd index in the array, the corresponding element is
odd.
Returns false if there is at least one odd index where the corresponding
element is not odd.

-----Note-----
There are no preconditions; the method will work for any array of integers.
-/

@[reducible, simp]
def isOddAtIndexOdd_precond (a : Array Int) : Prop := sorry

def isOddAtIndexOdd (a : Array Int) (h_precond : isOddAtIndexOdd_precond a) : Bool := sorry

@[reducible, simp]
def isOddAtIndexOdd_postcond (a : Array Int) (result : Bool) (h_precond : isOddAtIndexOdd_precond a) : Prop := sorry

theorem isOddAtIndexOdd_spec_satisfied (a : Array Int) (h_precond : isOddAtIndexOdd_precond a) :
    isOddAtIndexOdd_postcond a (isOddAtIndexOdd a h_precond) h_precond := by
  sorry

-- Test Guards

-- Test case 1
#guard isOddAtIndexOdd_precond (#[1, 2, 3, 4, 5])
#guard isOddAtIndexOdd_postcond (#[1, 2, 3, 4, 5]) (false) (by aesop)
#guard ¬(isOddAtIndexOdd_postcond (#[1, 2, 3, 4, 5]) (true) (by aesop))
#guard isOddAtIndexOdd (#[1, 2, 3, 4, 5]) (by aesop) = (false)

-- Test case 2
#guard isOddAtIndexOdd_precond (#[1, 3, 5, 7, 9])
#guard isOddAtIndexOdd_postcond (#[1, 3, 5, 7, 9]) (true) (by aesop)
#guard ¬(isOddAtIndexOdd_postcond (#[1, 3, 5, 7, 9]) (false) (by aesop))
#guard isOddAtIndexOdd (#[1, 3, 5, 7, 9]) (by aesop) = (true)

-- Test case 3
#guard isOddAtIndexOdd_precond (#[2, 4, 6, 8, 10])
#guard isOddAtIndexOdd_postcond (#[2, 4, 6, 8, 10]) (false) (by aesop)
#guard ¬(isOddAtIndexOdd_postcond (#[2, 4, 6, 8, 10]) (true) (by aesop))
#guard isOddAtIndexOdd (#[2, 4, 6, 8, 10]) (by aesop) = (false)

-- Test case 4
#guard isOddAtIndexOdd_precond (#[])
#guard isOddAtIndexOdd_postcond (#[]) (true) (by aesop)
#guard ¬(isOddAtIndexOdd_postcond (#[]) (false) (by aesop))
#guard isOddAtIndexOdd (#[]) (by aesop) = (true)

-- Test case 5
#guard isOddAtIndexOdd_precond (#[7])
#guard isOddAtIndexOdd_postcond (#[7]) (true) (by aesop)
#guard ¬(isOddAtIndexOdd_postcond (#[7]) (false) (by aesop))
#guard isOddAtIndexOdd (#[7]) (by aesop) = (true)

-- Test case 6
#guard isOddAtIndexOdd_precond (#[0, 1, 0, 1])
#guard isOddAtIndexOdd_postcond (#[0, 1, 0, 1]) (true) (by aesop)
#guard ¬(isOddAtIndexOdd_postcond (#[0, 1, 0, 1]) (false) (by aesop))
#guard isOddAtIndexOdd (#[0, 1, 0, 1]) (by aesop) = (true)

-- Test case 7
#guard isOddAtIndexOdd_precond (#[0, 2, 4, 6])
#guard isOddAtIndexOdd_postcond (#[0, 2, 4, 6]) (false) (by aesop)
#guard ¬(isOddAtIndexOdd_postcond (#[0, 2, 4, 6]) (true) (by aesop))
#guard isOddAtIndexOdd (#[0, 2, 4, 6]) (by aesop) = (false)
