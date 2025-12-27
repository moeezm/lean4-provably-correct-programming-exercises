import Aesop

/-
-----Description-----
This task requires writing a Lean 4 function that computes the longest common
subsequence (LCS) of two input strings.
A subsequence of a string is a sequence that can be derived from the original
string by deleting zero or more characters (not necessarily contiguous) without
changing the order of the remaining characters.
The function should return a string that is:
1) A subsequence of both input strings.
2) As long as possible among all such common subsequences.

If multiple LCS answers exist (with the same maximum length), returning any one
of them is acceptable.

-----Input-----
s1: The first input string.
s2: The second input string.

-----Output-----
A string representing a longest common subsequence of s1 and s2.


-/

@[reducible, simp]
def longestCommonSubsequence_precond (s1 : String) (s2 : String) : Prop := sorry

def longestCommonSubsequence (s1 : String) (s2 : String) (h_precond : longestCommonSubsequence_precond s1 s2) : String := sorry

@[reducible, simp]
def longestCommonSubsequence_postcond (s1 : String) (s2 : String) (result : String) (h_precond : longestCommonSubsequence_precond s1 s2) : Prop := sorry

theorem longestCommonSubsequence_spec_satisfied (s1 : String) (s2 : String) (h_precond : longestCommonSubsequence_precond s1 s2) :
    longestCommonSubsequence_postcond s1 s2 (longestCommonSubsequence s1 s2 h_precond) h_precond := by
  sorry

-- Test Guards

-- Test case 1
#guard longestCommonSubsequence_precond ("abcde") ("ace")
#guard longestCommonSubsequence_postcond ("abcde") ("ace") ("ace") (by aesop)
#guard ¬(longestCommonSubsequence_postcond ("abcde") ("ace") ("ab") (by aesop))
#guard ¬(longestCommonSubsequence_postcond ("abcde") ("ace") ("abc") (by aesop))
#guard ¬(longestCommonSubsequence_postcond ("abcde") ("ace") ("bce") (by aesop))
#guard longestCommonSubsequence ("abcde") ("ace") (by aesop) = ("ace")

-- Test case 2
#guard longestCommonSubsequence_precond ("aaaa") ("bbaaa")
#guard longestCommonSubsequence_postcond ("aaaa") ("bbaaa") ("aaa") (by aesop)
#guard ¬(longestCommonSubsequence_postcond ("aaaa") ("bbaaa") ("aaaaa") (by aesop))
#guard ¬(longestCommonSubsequence_postcond ("aaaa") ("bbaaa") ("b") (by aesop))
#guard ¬(longestCommonSubsequence_postcond ("aaaa") ("bbaaa") ("aaab") (by aesop))
#guard longestCommonSubsequence ("aaaa") ("bbaaa") (by aesop) = ("aaa")

-- Test case 3
#guard longestCommonSubsequence_precond ("xyz") ("abc")
#guard longestCommonSubsequence_postcond ("xyz") ("abc") ("") (by aesop)
#guard ¬(longestCommonSubsequence_postcond ("xyz") ("abc") ("x") (by aesop))
#guard ¬(longestCommonSubsequence_postcond ("xyz") ("abc") ("y") (by aesop))
#guard ¬(longestCommonSubsequence_postcond ("xyz") ("abc") ("a") (by aesop))
#guard ¬(longestCommonSubsequence_postcond ("xyz") ("abc") ("abc") (by aesop))
#guard longestCommonSubsequence ("xyz") ("abc") (by aesop) = ("")

-- Test case 4
#guard longestCommonSubsequence_precond ("axbxc") ("abxc")
#guard longestCommonSubsequence_postcond ("axbxc") ("abxc") ("abxc") (by aesop)
#guard ¬(longestCommonSubsequence_postcond ("axbxc") ("abxc") ("axc") (by aesop))
#guard ¬(longestCommonSubsequence_postcond ("axbxc") ("abxc") ("abcx") (by aesop))
#guard longestCommonSubsequence ("axbxc") ("abxc") (by aesop) = ("abxc")

-- Test case 5
#guard longestCommonSubsequence_precond ("AGGTAB") ("GXTXAYB")
#guard longestCommonSubsequence_postcond ("AGGTAB") ("GXTXAYB") ("GTAB") (by aesop)
#guard ¬(longestCommonSubsequence_postcond ("AGGTAB") ("GXTXAYB") ("GGTAB") (by aesop))
#guard ¬(longestCommonSubsequence_postcond ("AGGTAB") ("GXTXAYB") ("AGGTA") (by aesop))
#guard longestCommonSubsequence ("AGGTAB") ("GXTXAYB") (by aesop) = ("GTAB")
