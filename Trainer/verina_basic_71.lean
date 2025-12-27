import Aesop

/-
-----Description-----  
This problem involves determining the longest common prefix shared by two lists
of characters. Given two sequences, the goal is to identify and return the
maximal contiguous sequence of characters from the beginning of both lists that
are identical.

-----Input-----  
The input consists of:  
• str1: A list of characters.  
• str2: A list of characters.

-----Output-----  
The output is a list of characters representing the longest common prefix of
the two input lists. The output list satisfies the following conditions:
• Its length is less than or equal to the length of each input list.  
• It is exactly the prefix of both str1 and str2.  
• It is empty if the first characters of the inputs differ or if one of the
lists is empty.

-----Note-----  
It is assumed that both inputs are provided as valid lists of characters. The
function always returns the correct longest common prefix based on the inputs.
-/

@[reducible, simp]
def LongestCommonPrefix_precond (str1 : List Char) (str2 : List Char) : Prop := sorry

def LongestCommonPrefix (str1 : List Char) (str2 : List Char) (h_precond : LongestCommonPrefix_precond str1 str2) : List Char := sorry

@[reducible, simp]
def LongestCommonPrefix_postcond (str1 : List Char) (str2 : List Char) (result : List Char) (h_precond : LongestCommonPrefix_precond str1 str2) : Prop := sorry

theorem LongestCommonPrefix_spec_satisfied (str1 : List Char) (str2 : List Char) (h_precond : LongestCommonPrefix_precond str1 str2) :
    LongestCommonPrefix_postcond str1 str2 (LongestCommonPrefix str1 str2 h_precond) h_precond := by
  sorry

-- Test Guards

-- Test case 1
#guard LongestCommonPrefix_precond (['a', 'b', 'c']) (['a', 'b', 'd'])
#guard LongestCommonPrefix_postcond (['a', 'b', 'c']) (['a', 'b', 'd']) (['a', 'b']) (by aesop)
#guard ¬(LongestCommonPrefix_postcond (['a', 'b', 'c']) (['a', 'b', 'd']) (['a']) (by aesop))
#guard ¬(LongestCommonPrefix_postcond (['a', 'b', 'c']) (['a', 'b', 'd']) (['a', 'b', 'c']) (by aesop))
#guard LongestCommonPrefix (['a', 'b', 'c']) (['a', 'b', 'd']) (by aesop) = (['a', 'b'])

-- Test case 2
#guard LongestCommonPrefix_precond (['x', 'y', 'z']) (['x', 'y', 'z'])
#guard LongestCommonPrefix_postcond (['x', 'y', 'z']) (['x', 'y', 'z']) (['x', 'y', 'z']) (by aesop)
#guard ¬(LongestCommonPrefix_postcond (['x', 'y', 'z']) (['x', 'y', 'z']) (['x', 'y']) (by aesop))
#guard ¬(LongestCommonPrefix_postcond (['x', 'y', 'z']) (['x', 'y', 'z']) (['x', 'z']) (by aesop))
#guard LongestCommonPrefix (['x', 'y', 'z']) (['x', 'y', 'z']) (by aesop) = (['x', 'y', 'z'])

-- Test case 3
#guard LongestCommonPrefix_precond (['w', 'o']) (['w', 'o', 'w'])
#guard LongestCommonPrefix_postcond (['w', 'o']) (['w', 'o', 'w']) (['w', 'o']) (by aesop)
#guard ¬(LongestCommonPrefix_postcond (['w', 'o']) (['w', 'o', 'w']) (['w']) (by aesop))
#guard ¬(LongestCommonPrefix_postcond (['w', 'o']) (['w', 'o', 'w']) (['o']) (by aesop))
#guard ¬(LongestCommonPrefix_postcond (['w', 'o']) (['w', 'o', 'w']) (['w', 'o', 'w']) (by aesop))
#guard LongestCommonPrefix (['w', 'o']) (['w', 'o', 'w']) (by aesop) = (['w', 'o'])

-- Test case 4
#guard LongestCommonPrefix_precond (['a', 'x']) (['b', 'y'])
#guard LongestCommonPrefix_postcond (['a', 'x']) (['b', 'y']) ([]) (by aesop)
#guard ¬(LongestCommonPrefix_postcond (['a', 'x']) (['b', 'y']) (['a']) (by aesop))
#guard ¬(LongestCommonPrefix_postcond (['a', 'x']) (['b', 'y']) (['b']) (by aesop))
#guard LongestCommonPrefix (['a', 'x']) (['b', 'y']) (by aesop) = ([])

-- Test case 5
#guard LongestCommonPrefix_precond ([]) (['h', 'e', 'l', 'l', 'o'])
#guard LongestCommonPrefix_postcond ([]) (['h', 'e', 'l', 'l', 'o']) ([]) (by aesop)
#guard ¬(LongestCommonPrefix_postcond ([]) (['h', 'e', 'l', 'l', 'o']) (['h']) (by aesop))
#guard ¬(LongestCommonPrefix_postcond ([]) (['h', 'e', 'l', 'l', 'o']) (['e']) (by aesop))
#guard LongestCommonPrefix ([]) (['h', 'e', 'l', 'l', 'o']) (by aesop) = ([])
