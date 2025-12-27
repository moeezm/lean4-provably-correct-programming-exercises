import Aesop

/-
-----Description-----
This task requires writing a Lean 4 method that determines if a given string is
a palindrome, ignoring all
non-alphanumeric characters and case differences. For example, the string "A
man, a plan, a canal: Panama" should return
true.

-----Input-----
A single string:
s: The string to check for palindrome property.

-----Output-----
A boolean (Bool):
true if s is a palindrome when ignoring non-alphanumeric characters and case.
false otherwise.


-/

@[reducible, simp]
def palindromeIgnoreNonAlnum_precond (s : String) : Prop := sorry

def palindromeIgnoreNonAlnum (s : String) (h_precond : palindromeIgnoreNonAlnum_precond s) : Bool := sorry

@[reducible, simp]
def palindromeIgnoreNonAlnum_postcond (s : String) (result : Bool) (h_precond : palindromeIgnoreNonAlnum_precond s) : Prop := sorry

theorem palindromeIgnoreNonAlnum_spec_satisfied (s : String) (h_precond : palindromeIgnoreNonAlnum_precond s) :
    palindromeIgnoreNonAlnum_postcond s (palindromeIgnoreNonAlnum s h_precond) h_precond := by
  sorry

-- Test Guards

-- Test case 1
#guard palindromeIgnoreNonAlnum_precond ("")
#guard palindromeIgnoreNonAlnum_postcond ("") (true) (by aesop)
#guard ¬(palindromeIgnoreNonAlnum_postcond ("") (false) (by aesop))
#guard palindromeIgnoreNonAlnum ("") (by aesop) = (true)

-- Test case 2
#guard palindromeIgnoreNonAlnum_precond ("A man, a plan, a canal: Panama")
#guard palindromeIgnoreNonAlnum_postcond ("A man, a plan, a canal: Panama") (true) (by aesop)
#guard ¬(palindromeIgnoreNonAlnum_postcond ("A man, a plan, a canal: Panama") (false) (by aesop))
#guard palindromeIgnoreNonAlnum ("A man, a plan, a canal: Panama") (by aesop) = (true)

-- Test case 3
#guard palindromeIgnoreNonAlnum_precond ("race a car")
#guard palindromeIgnoreNonAlnum_postcond ("race a car") (false) (by aesop)
#guard ¬(palindromeIgnoreNonAlnum_postcond ("race a car") (true) (by aesop))
#guard palindromeIgnoreNonAlnum ("race a car") (by aesop) = (false)

-- Test case 4
#guard palindromeIgnoreNonAlnum_precond ("No 'x' in Nixon")
#guard palindromeIgnoreNonAlnum_postcond ("No 'x' in Nixon") (true) (by aesop)
#guard ¬(palindromeIgnoreNonAlnum_postcond ("No 'x' in Nixon") (false) (by aesop))
#guard palindromeIgnoreNonAlnum ("No 'x' in Nixon") (by aesop) = (true)

-- Test case 5
#guard palindromeIgnoreNonAlnum_precond ("abc!!cba?")
#guard palindromeIgnoreNonAlnum_postcond ("abc!!cba?") (true) (by aesop)
#guard ¬(palindromeIgnoreNonAlnum_postcond ("abc!!cba?") (false) (by aesop))
#guard palindromeIgnoreNonAlnum ("abc!!cba?") (by aesop) = (true)

-- Test case 6
#guard palindromeIgnoreNonAlnum_precond ("Hello, world!")
#guard palindromeIgnoreNonAlnum_postcond ("Hello, world!") (false) (by aesop)
#guard ¬(palindromeIgnoreNonAlnum_postcond ("Hello, world!") (true) (by aesop))
#guard palindromeIgnoreNonAlnum ("Hello, world!") (by aesop) = (false)
