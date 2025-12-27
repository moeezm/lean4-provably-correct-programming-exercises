import Aesop

/-
-----Description----- 
This task requires writing a Lean 4 method that replaces every occurrence of a
specified character within a string with a new character. The output should be a
new string that maintains the same length as the input string, with all
instances of the designated character replaced by the given substitute, and all
other characters preserved unchanged.

-----Input-----
The input consists of:
s: A string in which the replacement will occur.
oldChar: The character within the string that needs to be replaced.
newChar: The character that will substitute for every occurrence of oldChar.

-----Output-----
The output is a string that meets the following:
- It has the same length as the input string.
- All occurrences of oldChar in the input string are replaced with newChar.
- All characters other than oldChar remain unchanged.

-----Note-----
There are no preconditions; the method will always work. It is assumed that the
input string is valid and non-null.
-/

@[reducible, simp]
def replaceChars_precond (s : String) (oldChar : Char) (newChar : Char) : Prop := sorry

def replaceChars (s : String) (oldChar : Char) (newChar : Char) (h_precond : replaceChars_precond s oldChar newChar) : String := sorry

@[reducible, simp]
def replaceChars_postcond (s : String) (oldChar : Char) (newChar : Char) (result : String) (h_precond : replaceChars_precond s oldChar newChar) : Prop := sorry

theorem replaceChars_spec_satisfied (s : String) (oldChar : Char) (newChar : Char) (h_precond : replaceChars_precond s oldChar newChar) :
    replaceChars_postcond s oldChar newChar (replaceChars s oldChar newChar h_precond) h_precond := by
  sorry

-- Test Guards

-- Test case 1
#guard replaceChars_precond ("hello, world!") (",") (";")
#guard replaceChars_postcond ("hello, world!") (",") (";") ("hello; world!") (by aesop)
#guard ¬(replaceChars_postcond ("hello, world!") (",") (";") ("hello, world!") (by aesop))
#guard ¬(replaceChars_postcond ("hello, world!") (",") (";") ("hello world!") (by aesop))
#guard ¬(replaceChars_postcond ("hello, world!") (",") (";") ("hello;world!") (by aesop))
#guard replaceChars ("hello, world!") (",") (";") (by aesop) = ("hello; world!")

-- Test case 2
#guard replaceChars_precond ("a,b.c") (",") (":")
#guard replaceChars_postcond ("a,b.c") (",") (":") ("a:b.c") (by aesop)
#guard ¬(replaceChars_postcond ("a,b.c") (",") (":") ("a,b.c") (by aesop))
#guard ¬(replaceChars_postcond ("a,b.c") (",") (":") ("a;b.c") (by aesop))
#guard ¬(replaceChars_postcond ("a,b.c") (",") (":") ("ab:c") (by aesop))
#guard replaceChars ("a,b.c") (",") (":") (by aesop) = ("a:b.c")

-- Test case 3
#guard replaceChars_precond ("hello, world!") ("o") ("O")
#guard replaceChars_postcond ("hello, world!") ("o") ("O") ("hellO, wOrld!") (by aesop)
#guard ¬(replaceChars_postcond ("hello, world!") ("o") ("O") ("hello, world!") (by aesop))
#guard ¬(replaceChars_postcond ("hello, world!") ("o") ("O") ("hellO, world!") (by aesop))
#guard ¬(replaceChars_postcond ("hello, world!") ("o") ("O") ("hello, wOrld!") (by aesop))
#guard replaceChars ("hello, world!") ("o") ("O") (by aesop) = ("hellO, wOrld!")

-- Test case 4
#guard replaceChars_precond ("") ("x") ("y")
#guard replaceChars_postcond ("") ("x") ("y") ("") (by aesop)
#guard ¬(replaceChars_postcond ("") ("x") ("y") (" ") (by aesop))
#guard ¬(replaceChars_postcond ("") ("x") ("y") ("abc") (by aesop))
#guard replaceChars ("") ("x") ("y") (by aesop) = ("")

-- Test case 5
#guard replaceChars_precond ("test") ("x") ("y")
#guard replaceChars_postcond ("test") ("x") ("y") ("test") (by aesop)
#guard ¬(replaceChars_postcond ("test") ("x") ("y") ("testy") (by aesop))
#guard ¬(replaceChars_postcond ("test") ("x") ("y") ("tset") (by aesop))
#guard ¬(replaceChars_postcond ("test") ("x") ("y") ("yxest") (by aesop))
#guard replaceChars ("test") ("x") ("y") (by aesop) = ("test")

-- Test case 6
#guard replaceChars_precond ("unchanged") ("u") ("u")
#guard replaceChars_postcond ("unchanged") ("u") ("u") ("unchanged") (by aesop)
#guard ¬(replaceChars_postcond ("unchanged") ("u") ("u") ("nchanged") (by aesop))
#guard ¬(replaceChars_postcond ("unchanged") ("u") ("u") ("unchanged!") (by aesop))
#guard ¬(replaceChars_postcond ("unchanged") ("u") ("u") ("unchangEd") (by aesop))
#guard replaceChars ("unchanged") ("u") ("u") (by aesop) = ("unchanged")

-- Test case 7
#guard replaceChars_precond ("aaa") ("a") ("b")
#guard replaceChars_postcond ("aaa") ("a") ("b") ("bbb") (by aesop)
#guard ¬(replaceChars_postcond ("aaa") ("a") ("b") ("aaa") (by aesop))
#guard ¬(replaceChars_postcond ("aaa") ("a") ("b") ("abb") (by aesop))
#guard ¬(replaceChars_postcond ("aaa") ("a") ("b") ("bba") (by aesop))
#guard replaceChars ("aaa") ("a") ("b") (by aesop) = ("bbb")
