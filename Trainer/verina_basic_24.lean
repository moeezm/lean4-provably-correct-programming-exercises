import Aesop

/-
-----Description----- 
This task requires writing a Lean 4 method that finds the difference between
the first even number and the first odd number in an array of integers. The
method should process the array sequentially until it identifies the first even
number and the first odd number, and then return the difference calculated as
(first even number) minus (first odd number).

-----Input-----
The input consists of:
a: An array of integers.

-----Output-----
The output is an integer:
Returns the difference computed as the first even number minus the first odd
number found in the array.

-----Note-----
The input array is assumed to be non-empty and to contain at least one even
number and one odd number.
-/

@[reducible, simp]
def firstEvenOddDifference_precond (a : Array Int) : Prop := sorry

def firstEvenOddDifference (a : Array Int) (h_precond : firstEvenOddDifference_precond a) : Int := sorry

@[reducible, simp]
def firstEvenOddDifference_postcond (a : Array Int) (result : Int) (h_precond : firstEvenOddDifference_precond a) : Prop := sorry

theorem firstEvenOddDifference_spec_satisfied (a : Array Int) (h_precond : firstEvenOddDifference_precond a) :
    firstEvenOddDifference_postcond a (firstEvenOddDifference a h_precond) h_precond := by
  sorry

-- Test Guards

-- Rejected inputs
#guard ¬(firstEvenOddDifference_precond (#[2]))

-- Test case 1
#guard firstEvenOddDifference_precond (#[2, 3, 4, 5])
#guard firstEvenOddDifference_postcond (#[2, 3, 4, 5]) (-1) (by aesop)
#guard ¬(firstEvenOddDifference_postcond (#[2, 3, 4, 5]) (-2) (by aesop))
#guard ¬(firstEvenOddDifference_postcond (#[2, 3, 4, 5]) (1) (by aesop))
#guard ¬(firstEvenOddDifference_postcond (#[2, 3, 4, 5]) (-3) (by aesop))
#guard firstEvenOddDifference (#[2, 3, 4, 5]) (by aesop) = (-1)

-- Test case 2
#guard firstEvenOddDifference_precond (#[1, 4, 6, 8])
#guard firstEvenOddDifference_postcond (#[1, 4, 6, 8]) (3) (by aesop)
#guard ¬(firstEvenOddDifference_postcond (#[1, 4, 6, 8]) (2) (by aesop))
#guard ¬(firstEvenOddDifference_postcond (#[1, 4, 6, 8]) (4) (by aesop))
#guard ¬(firstEvenOddDifference_postcond (#[1, 4, 6, 8]) (5) (by aesop))
#guard firstEvenOddDifference (#[1, 4, 6, 8]) (by aesop) = (3)

-- Test case 3
#guard firstEvenOddDifference_precond (#[7, 2, 9, 4])
#guard firstEvenOddDifference_postcond (#[7, 2, 9, 4]) (-5) (by aesop)
#guard ¬(firstEvenOddDifference_postcond (#[7, 2, 9, 4]) (-3) (by aesop))
#guard ¬(firstEvenOddDifference_postcond (#[7, 2, 9, 4]) (-6) (by aesop))
#guard ¬(firstEvenOddDifference_postcond (#[7, 2, 9, 4]) (5) (by aesop))
#guard firstEvenOddDifference (#[7, 2, 9, 4]) (by aesop) = (-5)

-- Test case 4
#guard firstEvenOddDifference_precond (#[2, 2, 3, 3])
#guard firstEvenOddDifference_postcond (#[2, 2, 3, 3]) (-1) (by aesop)
#guard ¬(firstEvenOddDifference_postcond (#[2, 2, 3, 3]) (1) (by aesop))
#guard ¬(firstEvenOddDifference_postcond (#[2, 2, 3, 3]) (0) (by aesop))
#guard ¬(firstEvenOddDifference_postcond (#[2, 2, 3, 3]) (-2) (by aesop))
#guard firstEvenOddDifference (#[2, 2, 3, 3]) (by aesop) = (-1)

-- Test case 5
#guard firstEvenOddDifference_precond (#[1, 1, 2, 2])
#guard firstEvenOddDifference_postcond (#[1, 1, 2, 2]) (1) (by aesop)
#guard ¬(firstEvenOddDifference_postcond (#[1, 1, 2, 2]) (0) (by aesop))
#guard ¬(firstEvenOddDifference_postcond (#[1, 1, 2, 2]) (2) (by aesop))
#guard ¬(firstEvenOddDifference_postcond (#[1, 1, 2, 2]) (-1) (by aesop))
#guard firstEvenOddDifference (#[1, 1, 2, 2]) (by aesop) = (1)
