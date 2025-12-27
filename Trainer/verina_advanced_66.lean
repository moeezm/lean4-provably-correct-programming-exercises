import Aesop

/-
-----Description-----
Given an input string "words_str", this task requires writing a Lean 4 function
that reverses the order of its words. A word is defined as a contiguous sequence
of non-space characters. The function must remove any extra spaces so that the
output string contains words separated by a single space and has no leading or
trailing spaces. The characters within each word must stay the same as the
original input.

-----Input-----
words_str: A string that may contain leading, trailing, or multiple spaces
between words.

-----Output-----
A string with the words from the input reversed, where words are separated by a
single space, with no extra spaces at the beginning or end.


-/

@[reducible, simp]
def reverseWords_precond (words_str : String) : Prop := sorry

def reverseWords (words_str : String) (h_precond : reverseWords_precond words_str) : String := sorry

@[reducible, simp]
def reverseWords_postcond (words_str : String) (result : String) (h_precond : reverseWords_precond words_str) : Prop := sorry

theorem reverseWords_spec_satisfied (words_str : String) (h_precond : reverseWords_precond words_str) :
    reverseWords_postcond words_str (reverseWords words_str h_precond) h_precond := by
  sorry

-- Test Guards

-- Test case 1
#guard reverseWords_precond ("the sky is blue")
#guard reverseWords_postcond ("the sky is blue") ("blue is sky the") (by aesop)
#guard ¬(reverseWords_postcond ("the sky is blue") ("the sky is blue") (by aesop))
#guard ¬(reverseWords_postcond ("the sky is blue") ("sky the blue is") (by aesop))
#guard reverseWords ("the sky is blue") (by aesop) = ("blue is sky the")

-- Test case 2
#guard reverseWords_precond ("  hello world  ")
#guard reverseWords_postcond ("  hello world  ") ("world hello") (by aesop)
#guard ¬(reverseWords_postcond ("  hello world  ") ("hello world") (by aesop))
#guard ¬(reverseWords_postcond ("  hello world  ") ("worldhello") (by aesop))
#guard reverseWords ("  hello world  ") (by aesop) = ("world hello")

-- Test case 3
#guard reverseWords_precond ("a good   example")
#guard reverseWords_postcond ("a good   example") ("example good a") (by aesop)
#guard ¬(reverseWords_postcond ("a good   example") ("a good example") (by aesop))
#guard ¬(reverseWords_postcond ("a good   example") ("example a good") (by aesop))
#guard reverseWords ("a good   example") (by aesop) = ("example good a")

-- Test case 4
#guard reverseWords_precond ("  Bob    Loves  Alice   ")
#guard reverseWords_postcond ("  Bob    Loves  Alice   ") ("Alice Loves Bob") (by aesop)
#guard ¬(reverseWords_postcond ("  Bob    Loves  Alice   ") ("Bob Loves Alice") (by aesop))
#guard ¬(reverseWords_postcond ("  Bob    Loves  Alice   ") ("Alice Loves Bob ") (by aesop))
#guard reverseWords ("  Bob    Loves  Alice   ") (by aesop) = ("Alice Loves Bob")

-- Test case 5
#guard reverseWords_precond ("this lab is interesting")
#guard reverseWords_postcond ("this lab is interesting") ("interesting is lab this") (by aesop)
#guard ¬(reverseWords_postcond ("this lab is interesting") ("gnitseretni si bal siht") (by aesop))
#guard reverseWords ("this lab is interesting") (by aesop) = ("interesting is lab this")
