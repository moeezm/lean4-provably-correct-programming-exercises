import Aesop

/-
-----Description-----  
Determine whether two strings match based on a specific pattern: for each
position in the strings, either the characters are the same, or the character in
p is a wildcard represented by a question mark '?' that may match any character.

-----Input-----  
The input consists of:  
• s: A string that is to be matched.  
• p: A pattern string of equal length, where each character is either a
specific character or the wildcard '?'.

-----Output-----  
The output is a Boolean value:  
• Returns true if the length of s is equal to the length of p and each
corresponding character in s and p are either identical or the character in p is
a '?'.
• Returns false if any character in s does not match the corresponding
character in p and the character in p is not a '?'.

-----Note-----  
It is assumed that both strings provided have the same length.
-/

@[reducible, simp]
def Match_precond (s : String) (p : String) : Prop := sorry

def Match (s : String) (p : String) (h_precond : Match_precond s p) : Bool := sorry

@[reducible, simp]
def Match_postcond (s : String) (p : String) (result : Bool) (h_precond : Match_precond s p) : Prop := sorry

theorem Match_spec_satisfied (s : String) (p : String) (h_precond : Match_precond s p) :
    Match_postcond s p (Match s p h_precond) h_precond := by
  sorry

-- Test Guards

-- Rejected inputs
#guard ¬(Match_precond ("abc") ("ac"))

-- Test case 1
#guard Match_precond ("abc") ("a?c")
#guard Match_postcond ("abc") ("a?c") (true) (by aesop)
#guard ¬(Match_postcond ("abc") ("a?c") (false) (by aesop))
#guard Match ("abc") ("a?c") (by aesop) = (true)

-- Test case 2
#guard Match_precond ("hello") ("he?lo")
#guard Match_postcond ("hello") ("he?lo") (true) (by aesop)
#guard ¬(Match_postcond ("hello") ("he?lo") (false) (by aesop))
#guard Match ("hello") ("he?lo") (by aesop) = (true)

-- Test case 3
#guard Match_precond ("world") ("w?rld")
#guard Match_postcond ("world") ("w?rld") (true) (by aesop)
#guard ¬(Match_postcond ("world") ("w?rld") (false) (by aesop))
#guard Match ("world") ("w?rld") (by aesop) = (true)

-- Test case 4
#guard Match_precond ("test") ("te?t")
#guard Match_postcond ("test") ("te?t") (true) (by aesop)
#guard ¬(Match_postcond ("test") ("te?t") (false) (by aesop))
#guard Match ("test") ("te?t") (by aesop) = (true)

-- Test case 5
#guard Match_precond ("abc") ("abd")
#guard Match_postcond ("abc") ("abd") (false) (by aesop)
#guard ¬(Match_postcond ("abc") ("abd") (true) (by aesop))
#guard Match ("abc") ("abd") (by aesop) = (false)
