import Aesop

/-
-----Description----- 
This task requires writing a Lean 4 method that determines whether a given
integer is a power of two.
An integer n is a power of two if there exists an integer x such that n = 2^x.
The method should return true if n is a power of two, and false otherwise.
Note that negative numbers and zero are not powers of two.

-----Input-----
The input consists of one integer:
n: The integer to be tested.

-----Output-----
The output is a boolean:
Returns true if there exists an integer x such that n = 2^x (with n > 0),
otherwise false.


-/

@[reducible, simp]
def isPowerOfTwo_precond (n : Int) : Prop := sorry

def isPowerOfTwo (n : Int) (h_precond : isPowerOfTwo_precond n) : Bool := sorry

@[reducible, simp]
def isPowerOfTwo_postcond (n : Int) (result : Bool) (h_precond : isPowerOfTwo_precond n) : Prop := sorry

theorem isPowerOfTwo_spec_satisfied (n : Int) (h_precond : isPowerOfTwo_precond n) :
    isPowerOfTwo_postcond n (isPowerOfTwo n h_precond) h_precond := by
  sorry

-- Test Guards

-- Test case 1
#guard isPowerOfTwo_precond (1)
#guard isPowerOfTwo_postcond (1) (true) (by aesop)
#guard ¬(isPowerOfTwo_postcond (1) (false) (by aesop))
#guard isPowerOfTwo (1) (by aesop) = (true)

-- Test case 2
#guard isPowerOfTwo_precond (16)
#guard isPowerOfTwo_postcond (16) (true) (by aesop)
#guard ¬(isPowerOfTwo_postcond (16) (false) (by aesop))
#guard isPowerOfTwo (16) (by aesop) = (true)

-- Test case 3
#guard isPowerOfTwo_precond (3)
#guard isPowerOfTwo_postcond (3) (false) (by aesop)
#guard ¬(isPowerOfTwo_postcond (3) (true) (by aesop))
#guard isPowerOfTwo (3) (by aesop) = (false)

-- Test case 4
#guard isPowerOfTwo_precond (0)
#guard isPowerOfTwo_postcond (0) (false) (by aesop)
#guard ¬(isPowerOfTwo_postcond (0) (true) (by aesop))
#guard isPowerOfTwo (0) (by aesop) = (false)

-- Test case 5
#guard isPowerOfTwo_precond (-2)
#guard isPowerOfTwo_postcond (-2) (false) (by aesop)
#guard ¬(isPowerOfTwo_postcond (-2) (true) (by aesop))
#guard isPowerOfTwo (-2) (by aesop) = (false)

-- Test case 6
#guard isPowerOfTwo_precond (8)
#guard isPowerOfTwo_postcond (8) (true) (by aesop)
#guard ¬(isPowerOfTwo_postcond (8) (false) (by aesop))
#guard isPowerOfTwo (8) (by aesop) = (true)

-- Test case 7
#guard isPowerOfTwo_precond (10)
#guard isPowerOfTwo_postcond (10) (false) (by aesop)
#guard ¬(isPowerOfTwo_postcond (10) (true) (by aesop))
#guard isPowerOfTwo (10) (by aesop) = (false)
