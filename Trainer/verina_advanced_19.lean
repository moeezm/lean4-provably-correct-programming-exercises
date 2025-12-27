import Aesop

/-
-----Description-----
This task requires writing a Lean 4 method that checks whether a given string
is a palindrome. A palindrome is a string that reads the same forwards and
backwards. The function should ignore whitespace, punctuation, and
capitalization when checking for palindromes.

-----Input-----
The input consists of:
s: A string to be checked.

-----Output-----
The output is a boolean:
Returns true if the input string is a palindrome when non-alphabetic characters
are removed and letters are treated case-insensitively, and false otherwise.


-/

@[reducible, simp]
def isCleanPalindrome_precond (s : String) : Prop := sorry

def isCleanPalindrome (s : String) (h_precond : isCleanPalindrome_precond s) : Bool := sorry

@[reducible, simp]
def isCleanPalindrome_postcond (s : String) (result : Bool) (h_precond : isCleanPalindrome_precond s) : Prop := sorry

theorem isCleanPalindrome_spec_satisfied (s : String) (h_precond : isCleanPalindrome_precond s) :
    isCleanPalindrome_postcond s (isCleanPalindrome s h_precond) h_precond := by
  sorry

-- Test Guards

-- Test case 1
#guard isCleanPalindrome_precond ("A man, a plan, a canal, Panama")
#guard isCleanPalindrome_postcond ("A man, a plan, a canal, Panama") (true) (by aesop)
#guard ¬(isCleanPalindrome_postcond ("A man, a plan, a canal, Panama") (false) (by aesop))
#guard isCleanPalindrome ("A man, a plan, a canal, Panama") (by aesop) = (true)

-- Test case 2
#guard isCleanPalindrome_precond ("No lemon, no melon")
#guard isCleanPalindrome_postcond ("No lemon, no melon") (true) (by aesop)
#guard ¬(isCleanPalindrome_postcond ("No lemon, no melon") (false) (by aesop))
#guard isCleanPalindrome ("No lemon, no melon") (by aesop) = (true)

-- Test case 3
#guard isCleanPalindrome_precond ("OpenAI")
#guard isCleanPalindrome_postcond ("OpenAI") (false) (by aesop)
#guard ¬(isCleanPalindrome_postcond ("OpenAI") (true) (by aesop))
#guard isCleanPalindrome ("OpenAI") (by aesop) = (false)

-- Test case 4
#guard isCleanPalindrome_precond ("Was it a car or a cat I saw?")
#guard isCleanPalindrome_postcond ("Was it a car or a cat I saw?") (true) (by aesop)
#guard ¬(isCleanPalindrome_postcond ("Was it a car or a cat I saw?") (false) (by aesop))
#guard isCleanPalindrome ("Was it a car or a cat I saw?") (by aesop) = (true)

-- Test case 5
#guard isCleanPalindrome_precond ("Hello, World!")
#guard isCleanPalindrome_postcond ("Hello, World!") (false) (by aesop)
#guard ¬(isCleanPalindrome_postcond ("Hello, World!") (true) (by aesop))
#guard isCleanPalindrome ("Hello, World!") (by aesop) = (false)
