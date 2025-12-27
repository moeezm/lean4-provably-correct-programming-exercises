import Aesop

/-
-----Description-----
This task requires writing a Lean 4 function that converts a binary number
represented as a list of digits (0 or 1) into its corresponding decimal value.
The list is ordered in big-endian format, meaning the most significant digit
comes first.
The function should interpret the list as a binary number and return its
decimal representation as a natural number.

-----Input-----
The input is a list of natural numbers:
digits: A list of digits, each of which is either 0 or 1, representing a binary
number in big-endian order.

-----Output-----
The output is a natural number:
Returns the decimal value of the binary number represented by the input list.


-/

@[reducible, simp]
def binaryToDecimal_precond (digits : List Nat) : Prop := sorry

def binaryToDecimal (digits : List Nat) (h_precond : binaryToDecimal_precond digits) : Nat := sorry

@[reducible, simp]
def binaryToDecimal_postcond (digits : List Nat) (result : Nat) (h_precond : binaryToDecimal_precond digits) : Prop := sorry

theorem binaryToDecimal_spec_satisfied (digits : List Nat) (h_precond : binaryToDecimal_precond digits) :
    binaryToDecimal_postcond digits (binaryToDecimal digits h_precond) h_precond := by
  sorry

-- Test Guards

-- Rejected inputs
#guard ¬(binaryToDecimal_precond ([2]))

-- Test case 1
#guard binaryToDecimal_precond ([1, 0, 1])
#guard binaryToDecimal_postcond ([1, 0, 1]) (5) (by aesop)
#guard ¬(binaryToDecimal_postcond ([1, 0, 1]) (3) (by aesop))
#guard ¬(binaryToDecimal_postcond ([1, 0, 1]) (4) (by aesop))
#guard ¬(binaryToDecimal_postcond ([1, 0, 1]) (6) (by aesop))
#guard binaryToDecimal ([1, 0, 1]) (by aesop) = (5)

-- Test case 2
#guard binaryToDecimal_precond ([1, 1, 1, 1])
#guard binaryToDecimal_postcond ([1, 1, 1, 1]) (15) (by aesop)
#guard ¬(binaryToDecimal_postcond ([1, 1, 1, 1]) (14) (by aesop))
#guard ¬(binaryToDecimal_postcond ([1, 1, 1, 1]) (16) (by aesop))
#guard binaryToDecimal ([1, 1, 1, 1]) (by aesop) = (15)

-- Test case 3
#guard binaryToDecimal_precond ([0, 0, 0])
#guard binaryToDecimal_postcond ([0, 0, 0]) (0) (by aesop)
#guard ¬(binaryToDecimal_postcond ([0, 0, 0]) (1) (by aesop))
#guard ¬(binaryToDecimal_postcond ([0, 0, 0]) (2) (by aesop))
#guard binaryToDecimal ([0, 0, 0]) (by aesop) = (0)

-- Test case 4
#guard binaryToDecimal_precond ([1, 0, 0, 0, 0])
#guard binaryToDecimal_postcond ([1, 0, 0, 0, 0]) (16) (by aesop)
#guard ¬(binaryToDecimal_postcond ([1, 0, 0, 0, 0]) (8) (by aesop))
#guard ¬(binaryToDecimal_postcond ([1, 0, 0, 0, 0]) (0) (by aesop))
#guard binaryToDecimal ([1, 0, 0, 0, 0]) (by aesop) = (16)

-- Test case 5
#guard binaryToDecimal_precond ([])
#guard binaryToDecimal_postcond ([]) (0) (by aesop)
#guard ¬(binaryToDecimal_postcond ([]) (1) (by aesop))
#guard binaryToDecimal ([]) (by aesop) = (0)

-- Test case 6
#guard binaryToDecimal_precond ([1])
#guard binaryToDecimal_postcond ([1]) (1) (by aesop)
#guard ¬(binaryToDecimal_postcond ([1]) (0) (by aesop))
#guard binaryToDecimal ([1]) (by aesop) = (1)
