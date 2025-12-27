import Aesop

/-
-----Description-----
This task requires writing a Lean 4 method that reverses a given string. The
method should return a new string which consists of the characters of the input
string in reverse order.

-----Input-----
The input consists of:
s: A string (which may be empty).

-----Output-----
The output is a string:
Returns a string where the characters are in reverse order from the original
input.


-/

@[reducible, simp]
def reverseString_precond (s : String) : Prop := sorry

def reverseString (s : String) (h_precond : reverseString_precond s) : String := sorry

@[reducible, simp]
def reverseString_postcond (s : String) (result : String) (h_precond : reverseString_precond s) : Prop := sorry

theorem reverseString_spec_satisfied (s : String) (h_precond : reverseString_precond s) :
    reverseString_postcond s (reverseString s h_precond) h_precond := by
  sorry

-- Test Guards

-- Test case 1
#guard reverseString_precond ("hello")
#guard reverseString_postcond ("hello") ("olleh") (by aesop)
#guard ¬(reverseString_postcond ("hello") ("hello") (by aesop))
#guard ¬(reverseString_postcond ("hello") ("helo") (by aesop))
#guard ¬(reverseString_postcond ("hello") ("hell") (by aesop))
#guard reverseString ("hello") (by aesop) = ("olleh")

-- Test case 2
#guard reverseString_precond ("a")
#guard reverseString_postcond ("a") ("a") (by aesop)
#guard ¬(reverseString_postcond ("a") ("") (by aesop))
#guard ¬(reverseString_postcond ("a") ("aa") (by aesop))
#guard reverseString ("a") (by aesop) = ("a")

-- Test case 3
#guard reverseString_precond ("")
#guard reverseString_postcond ("") ("") (by aesop)
#guard ¬(reverseString_postcond ("") (" ") (by aesop))
#guard ¬(reverseString_postcond ("") ("a") (by aesop))
#guard reverseString ("") (by aesop) = ("")

-- Test case 4
#guard reverseString_precond ("racecar")
#guard reverseString_postcond ("racecar") ("racecar") (by aesop)
#guard ¬(reverseString_postcond ("racecar") ("rceacar") (by aesop))
#guard ¬(reverseString_postcond ("racecar") ("raeccar") (by aesop))
#guard reverseString ("racecar") (by aesop) = ("racecar")

-- Test case 5
#guard reverseString_precond ("Lean")
#guard reverseString_postcond ("Lean") ("naeL") (by aesop)
#guard ¬(reverseString_postcond ("Lean") ("Lean") (by aesop))
#guard ¬(reverseString_postcond ("Lean") ("aenL") (by aesop))
#guard reverseString ("Lean") (by aesop) = ("naeL")
