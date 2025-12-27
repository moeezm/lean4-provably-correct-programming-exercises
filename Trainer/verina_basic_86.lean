import Aesop

/-
-----Description-----  
This task requires writing a Lean 4 method that rotates an array of integers to
the left by a specified offset.

-----Input-----  
The input consists of:  
• a: An array of integers (which may be empty or non-empty).  
• offset: An integer representing the number of positions to rotate the array.
The offset is assumed to be non-negative.

-----Output-----  
The output is an array of integers that:  
• Has the same length as the input array.  
• For every valid index i, the output element at index i is equal to the input
element at index ((i + offset) mod n), where n is the array size.

-----Note-----  
If the array is empty, the method should return an empty array.
-/

@[reducible, simp]
def rotate_precond (a : Array Int) (offset : Int) : Prop := sorry

def rotate (a : Array Int) (offset : Int) (h_precond : rotate_precond a offset) : Array Int := sorry

@[reducible, simp]
def rotate_postcond (a : Array Int) (offset : Int) (result : Array Int) (h_precond : rotate_precond a offset) : Prop := sorry

theorem rotate_spec_satisfied (a : Array Int) (offset : Int) (h_precond : rotate_precond a offset) :
    rotate_postcond a offset (rotate a offset h_precond) h_precond := by
  sorry

-- Test Guards

-- Rejected inputs
#guard ¬(rotate_precond (#[1, 2, 3, 4, 5]) (-1))

-- Test case 1
#guard rotate_precond (#[1, 2, 3, 4, 5]) (2)
#guard rotate_postcond (#[1, 2, 3, 4, 5]) (2) (#[3, 4, 5, 1, 2]) (by aesop)
#guard ¬(rotate_postcond (#[1, 2, 3, 4, 5]) (2) (#[1, 2, 3, 4, 5]) (by aesop))
#guard ¬(rotate_postcond (#[1, 2, 3, 4, 5]) (2) (#[2, 3, 4, 5, 1]) (by aesop))
#guard rotate (#[1, 2, 3, 4, 5]) (2) (by aesop) = (#[3, 4, 5, 1, 2])

-- Test case 2
#guard rotate_precond (#[10, 20, 30, 40]) (1)
#guard rotate_postcond (#[10, 20, 30, 40]) (1) (#[20, 30, 40, 10]) (by aesop)
#guard ¬(rotate_postcond (#[10, 20, 30, 40]) (1) (#[10, 20, 30, 40]) (by aesop))
#guard ¬(rotate_postcond (#[10, 20, 30, 40]) (1) (#[40, 10, 20, 30]) (by aesop))
#guard rotate (#[10, 20, 30, 40]) (1) (by aesop) = (#[20, 30, 40, 10])

-- Test case 3
#guard rotate_precond (#[]) (5)
#guard rotate_postcond (#[]) (5) (#[]) (by aesop)
#guard ¬(rotate_postcond (#[]) (5) (#[0]) (by aesop))
#guard ¬(rotate_postcond (#[]) (5) (#[1]) (by aesop))
#guard rotate (#[]) (5) (by aesop) = (#[])

-- Test case 4
#guard rotate_precond (#[7]) (0)
#guard rotate_postcond (#[7]) (0) (#[7]) (by aesop)
#guard ¬(rotate_postcond (#[7]) (0) (#[0]) (by aesop))
#guard ¬(rotate_postcond (#[7]) (0) (#[8]) (by aesop))
#guard rotate (#[7]) (0) (by aesop) = (#[7])

-- Test case 5
#guard rotate_precond (#[-1, -2, -3, -4]) (3)
#guard rotate_postcond (#[-1, -2, -3, -4]) (3) (#[-4, -1, -2, -3]) (by aesop)
#guard ¬(rotate_postcond (#[-1, -2, -3, -4]) (3) (#[-1, -2, -3, -4]) (by aesop))
#guard ¬(rotate_postcond (#[-1, -2, -3, -4]) (3) (#[-3, -4, -1, -2]) (by aesop))
#guard rotate (#[-1, -2, -3, -4]) (3) (by aesop) = (#[-4, -1, -2, -3])

-- Test case 6
#guard rotate_precond (#[5, 10, 15]) (5)
#guard rotate_postcond (#[5, 10, 15]) (5) (#[15, 5, 10]) (by aesop)
#guard ¬(rotate_postcond (#[5, 10, 15]) (5) (#[5, 10, 15]) (by aesop))
#guard ¬(rotate_postcond (#[5, 10, 15]) (5) (#[10, 15, 5]) (by aesop))
#guard rotate (#[5, 10, 15]) (5) (by aesop) = (#[15, 5, 10])
