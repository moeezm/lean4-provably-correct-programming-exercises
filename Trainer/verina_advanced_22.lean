import Aesop

/-
-----Description----- 
This task requires writing a Lean 4 method that determines whether a list of
integers follows a peak-valley pattern.

A list follows this pattern if:
A. It strictly increases at first,
B. Then strictly decreases,
C. Both parts are non-empty.

Examples:
- [1, 3, 5, 4, 2] -> true
- [1, 2, 3] -> false
- [5, 4, 3] -> false
- [1, 2, 2, 1] -> false

-----Input-----
The input consists of a list of integers:

-----Output-----
The output is an integer:
Returns true if the list has a peak-valley structure, false otherwise.


-/

@[reducible, simp]
def isPeakValley_precond (lst : List Int) : Prop := sorry

def isPeakValley (lst : List Int) (h_precond : isPeakValley_precond lst) : Bool := sorry

@[reducible, simp]
def isPeakValley_postcond (lst : List Int) (result : Bool) (h_precond : isPeakValley_precond lst) : Prop := sorry

theorem isPeakValley_spec_satisfied (lst : List Int) (h_precond : isPeakValley_precond lst) :
    isPeakValley_postcond lst (isPeakValley lst h_precond) h_precond := by
  sorry

-- Test Guards

-- Test case 1
#guard isPeakValley_precond ([1, 3, 5, 2, 1])
#guard isPeakValley_postcond ([1, 3, 5, 2, 1]) (true) (by aesop)
#guard ¬(isPeakValley_postcond ([1, 3, 5, 2, 1]) (false) (by aesop))
#guard isPeakValley ([1, 3, 5, 2, 1]) (by aesop) = (true)

-- Test case 2
#guard isPeakValley_precond ([1, 2, 3, 4, 5])
#guard isPeakValley_postcond ([1, 2, 3, 4, 5]) (false) (by aesop)
#guard ¬(isPeakValley_postcond ([1, 2, 3, 4, 5]) (true) (by aesop))
#guard isPeakValley ([1, 2, 3, 4, 5]) (by aesop) = (false)

-- Test case 3
#guard isPeakValley_precond ([])
#guard isPeakValley_postcond ([]) (false) (by aesop)
#guard ¬(isPeakValley_postcond ([]) (true) (by aesop))
#guard isPeakValley ([]) (by aesop) = (false)

-- Test case 4
#guard isPeakValley_precond ([1])
#guard isPeakValley_postcond ([1]) (false) (by aesop)
#guard ¬(isPeakValley_postcond ([1]) (true) (by aesop))
#guard isPeakValley ([1]) (by aesop) = (false)

-- Test case 5
#guard isPeakValley_precond ([1, 1, 1, 1, 1])
#guard isPeakValley_postcond ([1, 1, 1, 1, 1]) (false) (by aesop)
#guard ¬(isPeakValley_postcond ([1, 1, 1, 1, 1]) (true) (by aesop))
#guard isPeakValley ([1, 1, 1, 1, 1]) (by aesop) = (false)

-- Test case 6
#guard isPeakValley_precond ([1, 10, 100, 1])
#guard isPeakValley_postcond ([1, 10, 100, 1]) (true) (by aesop)
#guard ¬(isPeakValley_postcond ([1, 10, 100, 1]) (false) (by aesop))
#guard isPeakValley ([1, 10, 100, 1]) (by aesop) = (true)
