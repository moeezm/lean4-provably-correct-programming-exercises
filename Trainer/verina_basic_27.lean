import Aesop

/-
-----Description----- 
This task requires writing a Lean 4 method that identifies the first repeated
character in a given string. The method should return a tuple containing a
Boolean value and a character. The Boolean value indicates whether any character
in the string is repeated. If it is true, the accompanying character is the
first character that appears more than once. If it is false, it indicates that
there are no repeated characters in the string.

-----Input-----
The input consists of:
s: A string.

-----Output-----
The output is a tuple (Bool × Char):
- Returns true and the first repeated character in the string if any repeated
character is found.
- Returns false and an arbitrary character if no repeated characters are
present.

-----Note-----
There are no preconditions; the method is expected to work for any non-null
string.
-/

@[reducible, simp]
def findFirstRepeatedChar_precond (s : String) : Prop := sorry

def findFirstRepeatedChar (s : String) (h_precond : findFirstRepeatedChar_precond s) : Option Char := sorry

@[reducible, simp]
def findFirstRepeatedChar_postcond (s : String) (result : Option Char) (h_precond : findFirstRepeatedChar_precond s) : Prop := sorry

theorem findFirstRepeatedChar_spec_satisfied (s : String) (h_precond : findFirstRepeatedChar_precond s) :
    findFirstRepeatedChar_postcond s (findFirstRepeatedChar s h_precond) h_precond := by
  sorry

-- Test Guards

-- Test case 1
#guard findFirstRepeatedChar_precond ("abca")
#guard findFirstRepeatedChar_postcond ("abca") ("some ('a')") (by aesop)
#guard ¬(findFirstRepeatedChar_postcond ("abca") ("some ('b')") (by aesop))
#guard ¬(findFirstRepeatedChar_postcond ("abca") ("some ('c')") (by aesop))
#guard ¬(findFirstRepeatedChar_postcond ("abca") ("none") (by aesop))
#guard findFirstRepeatedChar ("abca") (by aesop) = ("some ('a')")

-- Test case 2
#guard findFirstRepeatedChar_precond ("abcdef")
#guard findFirstRepeatedChar_postcond ("abcdef") ("none") (by aesop)
#guard ¬(findFirstRepeatedChar_postcond ("abcdef") ("some ('a')") (by aesop))
#guard ¬(findFirstRepeatedChar_postcond ("abcdef") ("some ('z')") (by aesop))
#guard findFirstRepeatedChar ("abcdef") (by aesop) = ("none")

-- Test case 3
#guard findFirstRepeatedChar_precond ("aabbcc")
#guard findFirstRepeatedChar_postcond ("aabbcc") ("some ('a')") (by aesop)
#guard ¬(findFirstRepeatedChar_postcond ("aabbcc") ("some ('b')") (by aesop))
#guard ¬(findFirstRepeatedChar_postcond ("aabbcc") ("some ('c')") (by aesop))
#guard ¬(findFirstRepeatedChar_postcond ("aabbcc") ("none") (by aesop))
#guard findFirstRepeatedChar ("aabbcc") (by aesop) = ("some ('a')")

-- Test case 4
#guard findFirstRepeatedChar_precond ("")
#guard findFirstRepeatedChar_postcond ("") ("none") (by aesop)
#guard ¬(findFirstRepeatedChar_postcond ("") ("some ('x')") (by aesop))
#guard ¬(findFirstRepeatedChar_postcond ("") ("some ('y')") (by aesop))
#guard findFirstRepeatedChar ("") (by aesop) = ("none")

-- Test case 5
#guard findFirstRepeatedChar_precond ("abbc")
#guard findFirstRepeatedChar_postcond ("abbc") ("some ('b')") (by aesop)
#guard ¬(findFirstRepeatedChar_postcond ("abbc") ("some ('a')") (by aesop))
#guard ¬(findFirstRepeatedChar_postcond ("abbc") ("some ('c')") (by aesop))
#guard ¬(findFirstRepeatedChar_postcond ("abbc") ("none") (by aesop))
#guard findFirstRepeatedChar ("abbc") (by aesop) = ("some ('b')")

-- Test case 6
#guard findFirstRepeatedChar_precond ("Aa")
#guard findFirstRepeatedChar_postcond ("Aa") ("none") (by aesop)
#guard ¬(findFirstRepeatedChar_postcond ("Aa") ("some ('A')") (by aesop))
#guard ¬(findFirstRepeatedChar_postcond ("Aa") ("some ('a')") (by aesop))
#guard findFirstRepeatedChar ("Aa") (by aesop) = ("none")
