import Aesop

/-
-----Description----- 
This task requires writing a Lean 4 method that generates all possible letter
combinations from a string of digits based on the traditional telephone keypad
letter mappings.

-----Input-----
The input consists of a string (String). The string may be empty.

-----Output-----
The output is a list of strings (List String) where each string represents a
unique combination of letters corresponding to the input digits. If the input
string is empty, the output is an empty list.

-----Note-----

Here is the mapping from the number to possible letters:
2: a or b or c
3: d or e or f
4: g or h or i
5: j or k or l
6: m or n or o
7: p or q or r or s
8: t or u or v
9: w or x or y or z
other number or not a number: no letters
-/

@[reducible, simp]
def letterCombinations_precond (digits : String) : Prop := sorry

def letterCombinations (digits : String) (h_precond : letterCombinations_precond digits) : List String := sorry

@[reducible, simp]
def letterCombinations_postcond (digits : String) (result : List String) (h_precond : letterCombinations_precond digits) : Prop := sorry

theorem letterCombinations_spec_satisfied (digits : String) (h_precond : letterCombinations_precond digits) :
    letterCombinations_postcond digits (letterCombinations digits h_precond) h_precond := by
  sorry

-- Test Guards

-- Test case 1
#guard letterCombinations_precond ("")
#guard letterCombinations_postcond ("") ([]) (by aesop)
#guard ¬(letterCombinations_postcond ("") (["a"]) (by aesop))
#guard ¬(letterCombinations_postcond ("") (["b"]) (by aesop))
#guard letterCombinations ("") (by aesop) = ([])

-- Test case 2
#guard letterCombinations_precond ("2")
#guard letterCombinations_postcond ("2") (["a", "b", "c"]) (by aesop)
#guard ¬(letterCombinations_postcond ("2") (["a"]) (by aesop))
#guard ¬(letterCombinations_postcond ("2") (["b"]) (by aesop))
#guard ¬(letterCombinations_postcond ("2") (["c"]) (by aesop))
#guard letterCombinations ("2") (by aesop) = (["a", "b", "c"])

-- Test case 3
#guard letterCombinations_precond ("9")
#guard letterCombinations_postcond ("9") (["w", "x", "y", "z"]) (by aesop)
#guard ¬(letterCombinations_postcond ("9") (["w"]) (by aesop))
#guard ¬(letterCombinations_postcond ("9") (["x"]) (by aesop))
#guard ¬(letterCombinations_postcond ("9") (["y"]) (by aesop))
#guard ¬(letterCombinations_postcond ("9") (["z"]) (by aesop))
#guard letterCombinations ("9") (by aesop) = (["w", "x", "y", "z"])

-- Test case 4
#guard letterCombinations_precond ("23")
#guard letterCombinations_postcond ("23") (["ad", "ae", "af", "bd", "be", "bf", "cd", "ce", "cf"]) (by aesop)
#guard ¬(letterCombinations_postcond ("23") (["a"]) (by aesop))
#guard ¬(letterCombinations_postcond ("23") (["b"]) (by aesop))
#guard ¬(letterCombinations_postcond ("23") (["c"]) (by aesop))
#guard letterCombinations ("23") (by aesop) = (["ad", "ae", "af", "bd", "be", "bf", "cd", "ce", "cf"])

-- Test case 5
#guard letterCombinations_precond ("27")
#guard letterCombinations_postcond ("27") (["ap", "aq", "ar", "as", "bp", "bq", "br", "bs", "cp", "cq", "cr", "cs"]) (by aesop)
#guard ¬(letterCombinations_postcond ("27") (["p"]) (by aesop))
#guard ¬(letterCombinations_postcond ("27") (["q"]) (by aesop))
#guard ¬(letterCombinations_postcond ("27") (["r"]) (by aesop))
#guard ¬(letterCombinations_postcond ("27") (["s"]) (by aesop))
#guard letterCombinations ("27") (by aesop) = (["ap", "aq", "ar", "as", "bp", "bq", "br", "bs", "cp", "cq", "cr", "cs"])

-- Test case 6
#guard letterCombinations_precond ("0")
#guard letterCombinations_postcond ("0") ([]) (by aesop)
#guard ¬(letterCombinations_postcond ("0") (["a"]) (by aesop))
#guard ¬(letterCombinations_postcond ("0") (["b"]) (by aesop))
#guard letterCombinations ("0") (by aesop) = ([])
