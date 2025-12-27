import Aesop

/-
-----Description-----  
This task requires writing a Lean 4 method that takes a given string and
returns a new string where every occurrence of a space, comma, or dot is
replaced with a colon. The transformation must preserve the original string’s
length and leave all other characters unmodified.

-----Input-----  
The input consists of:  
s: A string.

-----Output-----  
The output is a string:  
- The returned string must have the same length as the input string.  
- Every space, comma, or dot in the input string is replaced with a colon.  
- All other characters remain unchanged.

-----Note-----  
There are no preconditions; the input string is assumed to be non-null.
-/

@[reducible, simp]
def replaceWithColon_precond (s : String) : Prop := sorry

def replaceWithColon (s : String) (h_precond : replaceWithColon_precond s) : String := sorry

@[reducible, simp]
def replaceWithColon_postcond (s : String) (result : String) (h_precond : replaceWithColon_precond s) : Prop := sorry

theorem replaceWithColon_spec_satisfied (s : String) (h_precond : replaceWithColon_precond s) :
    replaceWithColon_postcond s (replaceWithColon s h_precond) h_precond := by
  sorry

-- Test Guards

-- Test case 1
#guard replaceWithColon_precond ("Hello, world. How are you?")
#guard replaceWithColon_postcond ("Hello, world. How are you?") ("Hello::world::How:are:you?") (by aesop)
#guard ¬(replaceWithColon_postcond ("Hello, world. How are you?") ("Hello,world,How,are,you?") (by aesop))
#guard ¬(replaceWithColon_postcond ("Hello, world. How are you?") ("Hello: world: How: are: you?") (by aesop))
#guard replaceWithColon ("Hello, world. How are you?") (by aesop) = ("Hello::world::How:are:you?")

-- Test case 2
#guard replaceWithColon_precond ("No-changes!")
#guard replaceWithColon_postcond ("No-changes!") ("No-changes!") (by aesop)
#guard ¬(replaceWithColon_postcond ("No-changes!") ("No changes!") (by aesop))
#guard ¬(replaceWithColon_postcond ("No-changes!") ("No–changes!") (by aesop))
#guard replaceWithColon ("No-changes!") (by aesop) = ("No-changes!")

-- Test case 3
#guard replaceWithColon_precond (",. ")
#guard replaceWithColon_postcond (",. ") (":::") (by aesop)
#guard ¬(replaceWithColon_postcond (",. ") ("::") (by aesop))
#guard ¬(replaceWithColon_postcond (",. ") (";:;") (by aesop))
#guard ¬(replaceWithColon_postcond (",. ") ("::: ") (by aesop))
#guard replaceWithColon (",. ") (by aesop) = (":::")

-- Test case 4
#guard replaceWithColon_precond ("")
#guard replaceWithColon_postcond ("") ("") (by aesop)
#guard ¬(replaceWithColon_postcond ("") (" ") (by aesop))
#guard ¬(replaceWithColon_postcond ("") ("a") (by aesop))
#guard replaceWithColon ("") (by aesop) = ("")
