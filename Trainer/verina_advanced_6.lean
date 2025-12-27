import Aesop

/-
-----Description----- 
This task requires writing a Lean 4 method that determines whether a given
string contains all 5 English vowels: a, e, i, o, u.

The check is case-insensitive, meaning that both uppercase and lowercase vowels
count.

-----Input-----
The input consists of a string:
s: A string of alphabetic characters (may include uppercase and lowercase)

-----Output-----
The output is true or false:
Returns true if the input string contains all 5 vowels (a, e, i, o, u), false
otherwise.


-/

@[reducible, simp]
def allVowels_precond (s : String) : Prop := sorry

def allVowels (s : String) (h_precond : allVowels_precond s) : Bool := sorry

@[reducible, simp]
def allVowels_postcond (s : String) (result : Bool) (h_precond : allVowels_precond s) : Prop := sorry

theorem allVowels_spec_satisfied (s : String) (h_precond : allVowels_precond s) :
    allVowels_postcond s (allVowels s h_precond) h_precond := by
  sorry

-- Test Guards

-- Test case 1
#guard allVowels_precond ("education")
#guard allVowels_postcond ("education") (true) (by aesop)
#guard ¬(allVowels_postcond ("education") (false) (by aesop))
#guard allVowels ("education") (by aesop) = (true)

-- Test case 2
#guard allVowels_precond ("education123")
#guard allVowels_postcond ("education123") (true) (by aesop)
#guard ¬(allVowels_postcond ("education123") (false) (by aesop))
#guard allVowels ("education123") (by aesop) = (true)

-- Test case 3
#guard allVowels_precond ("AEIOU")
#guard allVowels_postcond ("AEIOU") (true) (by aesop)
#guard ¬(allVowels_postcond ("AEIOU") (false) (by aesop))
#guard allVowels ("AEIOU") (by aesop) = (true)

-- Test case 4
#guard allVowels_precond ("hello")
#guard allVowels_postcond ("hello") (false) (by aesop)
#guard ¬(allVowels_postcond ("hello") (true) (by aesop))
#guard allVowels ("hello") (by aesop) = (false)

-- Test case 5
#guard allVowels_precond ("")
#guard allVowels_postcond ("") (false) (by aesop)
#guard ¬(allVowels_postcond ("") (true) (by aesop))
#guard allVowels ("") (by aesop) = (false)

-- Test case 6
#guard allVowels_precond ("apple orange union")
#guard allVowels_postcond ("apple orange union") (true) (by aesop)
#guard ¬(allVowels_postcond ("apple orange union") (false) (by aesop))
#guard allVowels ("apple orange union") (by aesop) = (true)
