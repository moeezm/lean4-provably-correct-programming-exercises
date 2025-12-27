import Aesop

/-
-----Description-----
This task involves computing the element-wise product of two integer arrays.
For each position in the arrays, the corresponding numbers are multiplied
together. If an element is missing in one of the arrays at a given index, the
missing value is treated as 0. When both arrays provide values for every index,
the resulting array will contain the product of the two numbers at each
corresponding index.

-----Input-----
The input consists of two arrays:
• a: An array of integers.
• b: An array of integers (should be of equal length to a for the specification
to hold).

-----Output-----
The output is an array of integers that:
• Has the same length as the input arrays.
• For each index i, the output array contains the product a[i] * b[i].
• In cases where one of the arrays might be shorter, missing elements default
to 0 during multiplication.

-----Note-----
It is assumed that the arrays are of equal length for the theorem
specification, although the implementation defaults missing indices to 0.
-/

@[reducible, simp]
def arrayProduct_precond (a : Array Int) (b : Array Int) : Prop := sorry

def arrayProduct (a : Array Int) (b : Array Int) (h_precond : arrayProduct_precond a b) : Array Int := sorry

@[reducible, simp]
def arrayProduct_postcond (a : Array Int) (b : Array Int) (result : Array Int) (h_precond : arrayProduct_precond a b) : Prop := sorry

theorem arrayProduct_spec_satisfied (a : Array Int) (b : Array Int) (h_precond : arrayProduct_precond a b) :
    arrayProduct_postcond a b (arrayProduct a b h_precond) h_precond := by
  sorry

-- Test Guards

-- Rejected inputs
#guard ¬(arrayProduct_precond (#[1, 2, 3]) (#[4, 5]))

-- Test case 1
#guard arrayProduct_precond (#[1, 2, 3]) (#[4, 5, 6])
#guard arrayProduct_postcond (#[1, 2, 3]) (#[4, 5, 6]) (#[4, 10, 18]) (by aesop)
#guard ¬(arrayProduct_postcond (#[1, 2, 3]) (#[4, 5, 6]) (#[4, 10, 17]) (by aesop))
#guard ¬(arrayProduct_postcond (#[1, 2, 3]) (#[4, 5, 6]) (#[0, 10, 18]) (by aesop))
#guard ¬(arrayProduct_postcond (#[1, 2, 3]) (#[4, 5, 6]) (#[4, 10, 20]) (by aesop))
#guard arrayProduct (#[1, 2, 3]) (#[4, 5, 6]) (by aesop) = (#[4, 10, 18])

-- Test case 2
#guard arrayProduct_precond (#[0, 0, 0]) (#[1, 2, 3])
#guard arrayProduct_postcond (#[0, 0, 0]) (#[1, 2, 3]) (#[0, 0, 0]) (by aesop)
#guard ¬(arrayProduct_postcond (#[0, 0, 0]) (#[1, 2, 3]) (#[1, 0, 0]) (by aesop))
#guard ¬(arrayProduct_postcond (#[0, 0, 0]) (#[1, 2, 3]) (#[0, 1, 0]) (by aesop))
#guard ¬(arrayProduct_postcond (#[0, 0, 0]) (#[1, 2, 3]) (#[0, 0, 1]) (by aesop))
#guard arrayProduct (#[0, 0, 0]) (#[1, 2, 3]) (by aesop) = (#[0, 0, 0])

-- Test case 3
#guard arrayProduct_precond (#[-1, 2, -3]) (#[3, -4, 5])
#guard arrayProduct_postcond (#[-1, 2, -3]) (#[3, -4, 5]) (#[-3, -8, -15]) (by aesop)
#guard ¬(arrayProduct_postcond (#[-1, 2, -3]) (#[3, -4, 5]) (#[-3, -8, -14]) (by aesop))
#guard ¬(arrayProduct_postcond (#[-1, 2, -3]) (#[3, -4, 5]) (#[-3, -7, -15]) (by aesop))
#guard ¬(arrayProduct_postcond (#[-1, 2, -3]) (#[3, -4, 5]) (#[-2, -8, -15]) (by aesop))
#guard arrayProduct (#[-1, 2, -3]) (#[3, -4, 5]) (by aesop) = (#[-3, -8, -15])

-- Test case 4
#guard arrayProduct_precond (#[2]) (#[10])
#guard arrayProduct_postcond (#[2]) (#[10]) (#[20]) (by aesop)
#guard ¬(arrayProduct_postcond (#[2]) (#[10]) (#[10]) (by aesop))
#guard ¬(arrayProduct_postcond (#[2]) (#[10]) (#[0]) (by aesop))
#guard ¬(arrayProduct_postcond (#[2]) (#[10]) (#[30]) (by aesop))
#guard arrayProduct (#[2]) (#[10]) (by aesop) = (#[20])

-- Test case 5
#guard arrayProduct_precond (#[1, 2, 3, 4]) (#[2, 2, 2, 2])
#guard arrayProduct_postcond (#[1, 2, 3, 4]) (#[2, 2, 2, 2]) (#[2, 4, 6, 8]) (by aesop)
#guard ¬(arrayProduct_postcond (#[1, 2, 3, 4]) (#[2, 2, 2, 2]) (#[2, 4, 6, 9]) (by aesop))
#guard ¬(arrayProduct_postcond (#[1, 2, 3, 4]) (#[2, 2, 2, 2]) (#[1, 4, 6, 8]) (by aesop))
#guard ¬(arrayProduct_postcond (#[1, 2, 3, 4]) (#[2, 2, 2, 2]) (#[2, 5, 6, 8]) (by aesop))
#guard arrayProduct (#[1, 2, 3, 4]) (#[2, 2, 2, 2]) (by aesop) = (#[2, 4, 6, 8])
