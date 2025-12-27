import Aesop

/-
-----Description----- 
This task requires writing a Lean 4 method that returns true if the input n is
divisible by 8 or has 8 as one of it's digits.

-----Input-----
The input consists of one integer:
n: The main integer.

-----Output-----
The output is an boolean:
Returns true if the input is divisible by 8 or has 8 as one of it's digits.


-/

@[reducible, simp]
def isItEight_precond (n : Int) : Prop := sorry

def isItEight (n : Int) (h_precond : isItEight_precond n) : Bool := sorry

@[reducible, simp]
def isItEight_postcond (n : Int) (result : Bool) (h_precond : isItEight_precond n) : Prop := sorry

theorem isItEight_spec_satisfied (n : Int) (h_precond : isItEight_precond n) :
    isItEight_postcond n (isItEight n h_precond) h_precond := by
  sorry

-- Test Guards

-- Test case 1
#guard isItEight_precond (8)
#guard isItEight_postcond (8) (true) (by aesop)
#guard ¬(isItEight_postcond (8) (false) (by aesop))
#guard isItEight (8) (by aesop) = (true)

-- Test case 2
#guard isItEight_precond (98)
#guard isItEight_postcond (98) (true) (by aesop)
#guard ¬(isItEight_postcond (98) (false) (by aesop))
#guard isItEight (98) (by aesop) = (true)

-- Test case 3
#guard isItEight_precond (1224)
#guard isItEight_postcond (1224) (true) (by aesop)
#guard ¬(isItEight_postcond (1224) (false) (by aesop))
#guard isItEight (1224) (by aesop) = (true)

-- Test case 4
#guard isItEight_precond (73)
#guard isItEight_postcond (73) (false) (by aesop)
#guard ¬(isItEight_postcond (73) (true) (by aesop))
#guard isItEight (73) (by aesop) = (false)

-- Test case 5
#guard isItEight_precond (208)
#guard isItEight_postcond (208) (true) (by aesop)
#guard ¬(isItEight_postcond (208) (false) (by aesop))
#guard isItEight (208) (by aesop) = (true)

-- Test case 6
#guard isItEight_precond (0)
#guard isItEight_postcond (0) (true) (by aesop)
#guard ¬(isItEight_postcond (0) (false) (by aesop))
#guard isItEight (0) (by aesop) = (true)

-- Test case 7
#guard isItEight_precond (-123456780)
#guard isItEight_postcond (-123456780) (true) (by aesop)
#guard ¬(isItEight_postcond (-123456780) (false) (by aesop))
#guard isItEight (-123456780) (by aesop) = (true)

-- Test case 8
#guard isItEight_precond (1)
#guard isItEight_postcond (1) (false) (by aesop)
#guard ¬(isItEight_postcond (1) (true) (by aesop))
#guard isItEight (1) (by aesop) = (false)

-- Test case 9
#guard isItEight_precond (-9999)
#guard isItEight_postcond (-9999) (false) (by aesop)
#guard ¬(isItEight_postcond (-9999) (true) (by aesop))
#guard isItEight (-9999) (by aesop) = (false)

-- Test case 10
#guard isItEight_precond (-123453)
#guard isItEight_postcond (-123453) (false) (by aesop)
#guard ¬(isItEight_postcond (-123453) (true) (by aesop))
#guard isItEight (-123453) (by aesop) = (false)
