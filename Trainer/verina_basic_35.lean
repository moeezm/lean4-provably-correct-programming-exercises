import Aesop

/-
-----Description----- 
This task requires writing a Lean 4 method that rearranges an array of integers
by moving all zero values to the end of the array. The method should ensure that
the relative order of the non-zero elements remains the same, the overall size
of the array is unchanged, and the number of zeroes in the array stays constant.

-----Input-----
The input consists of:
arr: An array of integers.

-----Output-----
The output is an array of integers:
Returns an array where:
- The length is the same as that of the input array.
- All zero values are positioned at the end.
- The relative order of non-zero elements is preserved.
- The count of zero values remains the same as in the input array.

-----Note-----
There are no preconditions; the method will always work for any array of
integers.
-/

@[reducible, simp]
def MoveZeroesToEnd_precond (arr : Array Int) : Prop := sorry

def MoveZeroesToEnd (arr : Array Int) (h_precond : MoveZeroesToEnd_precond arr) : Array Int := sorry

@[reducible, simp]
def MoveZeroesToEnd_postcond (arr : Array Int) (result : Array Int) (h_precond : MoveZeroesToEnd_precond arr) : Prop := sorry

theorem MoveZeroesToEnd_spec_satisfied (arr : Array Int) (h_precond : MoveZeroesToEnd_precond arr) :
    MoveZeroesToEnd_postcond arr (MoveZeroesToEnd arr h_precond) h_precond := by
  sorry

-- Test Guards

-- Test case 1
#guard MoveZeroesToEnd_precond (#[0, 1, 0, 3, 12])
#guard MoveZeroesToEnd_postcond (#[0, 1, 0, 3, 12]) (#[1, 3, 12, 0, 0]) (by aesop)
#guard ¬(MoveZeroesToEnd_postcond (#[0, 1, 0, 3, 12]) (#[0, 1, 0, 3, 12]) (by aesop))
#guard ¬(MoveZeroesToEnd_postcond (#[0, 1, 0, 3, 12]) (#[1, 0, 3, 12, 0]) (by aesop))
#guard MoveZeroesToEnd (#[0, 1, 0, 3, 12]) (by aesop) = (#[1, 3, 12, 0, 0])

-- Test case 2
#guard MoveZeroesToEnd_precond (#[0, 0, 1])
#guard MoveZeroesToEnd_postcond (#[0, 0, 1]) (#[1, 0, 0]) (by aesop)
#guard ¬(MoveZeroesToEnd_postcond (#[0, 0, 1]) (#[0, 0, 1]) (by aesop))
#guard ¬(MoveZeroesToEnd_postcond (#[0, 0, 1]) (#[0, 1, 0]) (by aesop))
#guard MoveZeroesToEnd (#[0, 0, 1]) (by aesop) = (#[1, 0, 0])

-- Test case 3
#guard MoveZeroesToEnd_precond (#[1, 2, 3])
#guard MoveZeroesToEnd_postcond (#[1, 2, 3]) (#[1, 2, 3]) (by aesop)
#guard ¬(MoveZeroesToEnd_postcond (#[1, 2, 3]) (#[1, 3, 2]) (by aesop))
#guard ¬(MoveZeroesToEnd_postcond (#[1, 2, 3]) (#[2, 1, 3]) (by aesop))
#guard MoveZeroesToEnd (#[1, 2, 3]) (by aesop) = (#[1, 2, 3])

-- Test case 4
#guard MoveZeroesToEnd_precond (#[0, 0, 0])
#guard MoveZeroesToEnd_postcond (#[0, 0, 0]) (#[0, 0, 0]) (by aesop)
#guard ¬(MoveZeroesToEnd_postcond (#[0, 0, 0]) (#[1, 0, 0]) (by aesop))
#guard ¬(MoveZeroesToEnd_postcond (#[0, 0, 0]) (#[0, 1, 0]) (by aesop))
#guard MoveZeroesToEnd (#[0, 0, 0]) (by aesop) = (#[0, 0, 0])

-- Test case 5
#guard MoveZeroesToEnd_precond (#[])
#guard MoveZeroesToEnd_postcond (#[]) (#[]) (by aesop)
#guard ¬(MoveZeroesToEnd_postcond (#[]) (#[0]) (by aesop))
#guard ¬(MoveZeroesToEnd_postcond (#[]) (#[1]) (by aesop))
#guard MoveZeroesToEnd (#[]) (by aesop) = (#[])
