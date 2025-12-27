import Aesop

/-
-----Description-----
Implement a Lean 4 function that checks if a given string is a palindrome. A
string is considered a palindrome
if it reads the same forward and backward.

-----Input-----
The input consists of a single string:
s: A string

-----Output-----
The output is a boolean:
Returns true if s is a palindrome, false otherwise.


-/

@[reducible, simp]
def isPalindrome_precond (s : String) : Prop := sorry

def isPalindrome (s : String) (h_precond : isPalindrome_precond s) : Bool := sorry

@[reducible, simp]
def isPalindrome_postcond (s : String) (result : Bool) (h_precond : isPalindrome_precond s) : Prop := sorry

theorem isPalindrome_spec_satisfied (s : String) (h_precond : isPalindrome_precond s) :
    isPalindrome_postcond s (isPalindrome s h_precond) h_precond := by
  sorry

-- Test Guards

-- Test case 1
#guard isPalindrome_precond ("racecar")
#guard isPalindrome_postcond ("racecar") (true) (by aesop)
#guard ¬(isPalindrome_postcond ("racecar") (false) (by aesop))
#guard isPalindrome ("racecar") (by aesop) = (true)

-- Test case 2
#guard isPalindrome_precond ("abba")
#guard isPalindrome_postcond ("abba") (true) (by aesop)
#guard ¬(isPalindrome_postcond ("abba") (false) (by aesop))
#guard isPalindrome ("abba") (by aesop) = (true)

-- Test case 3
#guard isPalindrome_precond ("abc")
#guard isPalindrome_postcond ("abc") (false) (by aesop)
#guard ¬(isPalindrome_postcond ("abc") (true) (by aesop))
#guard isPalindrome ("abc") (by aesop) = (false)

-- Test case 4
#guard isPalindrome_precond ("")
#guard isPalindrome_postcond ("") (true) (by aesop)
#guard ¬(isPalindrome_postcond ("") (false) (by aesop))
#guard isPalindrome ("") (by aesop) = (true)

-- Test case 5
#guard isPalindrome_precond ("a")
#guard isPalindrome_postcond ("a") (true) (by aesop)
#guard ¬(isPalindrome_postcond ("a") (false) (by aesop))
#guard isPalindrome ("a") (by aesop) = (true)
