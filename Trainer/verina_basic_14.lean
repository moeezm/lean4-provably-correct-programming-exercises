import Aesop

/-
-----Description----- 
This task requires writing a Lean 4 method that determines whether a given
string contains the character 'z' or 'Z'. The method should return true if the
string includes either the lowercase or uppercase letter 'z', and false
otherwise.

-----Input-----
The input consists of:
s: A string.

-----Output-----
The output is a Boolean value:
Returns true if the input string contains the character 'z' or 'Z'.
Returns false if the input string does not contain the character 'z' or 'Z'.

-----Note-----
There are no preconditions; the method will always work as strings and
sequences are considered non-null.
-/

@[reducible, simp]
def containsZ_precond (s : String) : Prop := sorry

def containsZ (s : String) (h_precond : containsZ_precond s) : Bool := sorry

@[reducible, simp]
def containsZ_postcond (s : String) (result : Bool) (h_precond : containsZ_precond s) : Prop := sorry

theorem containsZ_spec_satisfied (s : String) (h_precond : containsZ_precond s) :
    containsZ_postcond s (containsZ s h_precond) h_precond := by
  sorry

-- Test Guards

-- Test case 1
#guard containsZ_precond ("hello")
#guard containsZ_postcond ("hello") (false) (by aesop)
#guard ¬(containsZ_postcond ("hello") (true) (by aesop))
#guard containsZ ("hello") (by aesop) = (false)

-- Test case 2
#guard containsZ_precond ("zebra")
#guard containsZ_postcond ("zebra") (true) (by aesop)
#guard ¬(containsZ_postcond ("zebra") (false) (by aesop))
#guard containsZ ("zebra") (by aesop) = (true)

-- Test case 3
#guard containsZ_precond ("Zebra")
#guard containsZ_postcond ("Zebra") (true) (by aesop)
#guard ¬(containsZ_postcond ("Zebra") (false) (by aesop))
#guard containsZ ("Zebra") (by aesop) = (true)

-- Test case 4
#guard containsZ_precond ("")
#guard containsZ_postcond ("") (false) (by aesop)
#guard ¬(containsZ_postcond ("") (true) (by aesop))
#guard containsZ ("") (by aesop) = (false)

-- Test case 5
#guard containsZ_precond ("crazy")
#guard containsZ_postcond ("crazy") (true) (by aesop)
#guard ¬(containsZ_postcond ("crazy") (false) (by aesop))
#guard containsZ ("crazy") (by aesop) = (true)

-- Test case 6
#guard containsZ_precond ("AZ")
#guard containsZ_postcond ("AZ") (true) (by aesop)
#guard ¬(containsZ_postcond ("AZ") (false) (by aesop))
#guard containsZ ("AZ") (by aesop) = (true)

-- Test case 7
#guard containsZ_precond ("abc")
#guard containsZ_postcond ("abc") (false) (by aesop)
#guard ¬(containsZ_postcond ("abc") (true) (by aesop))
#guard containsZ ("abc") (by aesop) = (false)

-- Test case 8
#guard containsZ_precond ("Zz")
#guard containsZ_postcond ("Zz") (true) (by aesop)
#guard ¬(containsZ_postcond ("Zz") (false) (by aesop))
#guard containsZ ("Zz") (by aesop) = (true)

-- Test case 9
#guard containsZ_precond ("no letter")
#guard containsZ_postcond ("no letter") (false) (by aesop)
#guard ¬(containsZ_postcond ("no letter") (true) (by aesop))
#guard containsZ ("no letter") (by aesop) = (false)
