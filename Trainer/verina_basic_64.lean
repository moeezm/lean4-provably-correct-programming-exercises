import Aesop

/-
-----Description-----  
This task requires writing a Lean 4 method that inserts a subarray of
characters into another array of characters at a specified index. The method
takes the original array (oline) and, given the effective length l to consider,
inserts another array of characters (nl) of effective length p starting at the
index atPos. The resulting array is of length l + p and is constructed as
follows:
• All characters before the insertion position (atPos) remain unchanged.  
• The new characters from nl are inserted starting at index atPos.  
• The remaining characters from the original array (starting at atPos) are
shifted right by p positions.

-----Input-----  
The input consists of:  
• oline: An array of characters representing the original sequence.  
• l: A natural number indicating how many characters from oline to consider.  
• nl: An array of characters to be inserted into oline.  
• p: A natural number indicating how many characters from nl to consider for
insertion.
• atPos: A natural number indicating the position in oline where the insertion
should occur (0-indexed).

-----Output-----  
The output is an array of characters that is the result of inserting nl into
oline at the given atPos. Specifically, the output array should:
• Contain the original characters from index 0 up to (but not including) atPos.
• Have the next p characters equal to the characters from nl.  
• Contain the remaining characters from oline (starting from atPos) shifted
right by p positions.

-----Note-----  
It is assumed that:  
• atPos is within the range [0, l].  
• l does not exceed the size of oline.  
• p does not exceed the size of nl.
-/

@[reducible, simp]
def insert_precond (oline : Array Char) (l : Nat) (nl : Array Char) (p : Nat) (atPos : Nat) : Prop := sorry

def insert (oline : Array Char) (l : Nat) (nl : Array Char) (p : Nat) (atPos : Nat) (h_precond : insert_precond oline l nl p atPos) : Array Char := sorry

@[reducible, simp]
def insert_postcond (oline : Array Char) (l : Nat) (nl : Array Char) (p : Nat) (atPos : Nat) (result : Array Char) (h_precond : insert_precond oline l nl p atPos) : Prop := sorry

theorem insert_spec_satisfied (oline : Array Char) (l : Nat) (nl : Array Char) (p : Nat) (atPos : Nat) (h_precond : insert_precond oline l nl p atPos) :
    insert_postcond oline l nl p atPos (insert oline l nl p atPos h_precond) h_precond := by
  sorry

-- Test Guards

-- Rejected inputs
#guard ¬(insert_precond (#['a','b','c']) (5) (#['X','Y']) (3) (2))

-- Test case 1
#guard insert_precond (#['a','b','c','d','e']) (5) (#['X','Y']) (2) (2)
#guard insert_postcond (#['a','b','c','d','e']) (5) (#['X','Y']) (2) (2) (#['a','b','X','Y','c','d','e']) (by aesop)
#guard ¬(insert_postcond (#['a','b','c','d','e']) (5) (#['X','Y']) (2) (2) (#['a','b','X','Y','c','d']) (by aesop))
#guard ¬(insert_postcond (#['a','b','c','d','e']) (5) (#['X','Y']) (2) (2) (#['a','b','X','Y','c','d','f']) (by aesop))
#guard ¬(insert_postcond (#['a','b','c','d','e']) (5) (#['X','Y']) (2) (2) (#['a','X','b','Y','c','d','e']) (by aesop))
#guard insert (#['a','b','c','d','e']) (5) (#['X','Y']) (2) (2) (by aesop) = (#['a','b','X','Y','c','d','e'])

-- Test case 2
#guard insert_precond (#['H','e','l','l','o']) (5) (#['W','o','r','l','d']) (5) (0)
#guard insert_postcond (#['H','e','l','l','o']) (5) (#['W','o','r','l','d']) (5) (0) (#['W','o','r','l','d','H','e','l','l','o']) (by aesop)
#guard ¬(insert_postcond (#['H','e','l','l','o']) (5) (#['W','o','r','l','d']) (5) (0) (#['H','e','l','l','o','W','o','r','l','d']) (by aesop))
#guard ¬(insert_postcond (#['H','e','l','l','o']) (5) (#['W','o','r','l','d']) (5) (0) (#['W','o','r','l','d','H','e','l','l','o','!']) (by aesop))
#guard ¬(insert_postcond (#['H','e','l','l','o']) (5) (#['W','o','r','l','d']) (5) (0) (#['W','o','r','l','d','W','o','r','l','d']) (by aesop))
#guard insert (#['H','e','l','l','o']) (5) (#['W','o','r','l','d']) (5) (0) (by aesop) = (#['W','o','r','l','d','H','e','l','l','o'])

-- Test case 3
#guard insert_precond (#['L','e','a','n']) (4) (#['4']) (1) (4)
#guard insert_postcond (#['L','e','a','n']) (4) (#['4']) (1) (4) (#['L','e','a','n','4']) (by aesop)
#guard ¬(insert_postcond (#['L','e','a','n']) (4) (#['4']) (1) (4) (#['L','e','a','n']) (by aesop))
#guard ¬(insert_postcond (#['L','e','a','n']) (4) (#['4']) (1) (4) (#['L','e','a','n',' ']) (by aesop))
#guard ¬(insert_postcond (#['L','e','a','n']) (4) (#['4']) (1) (4) (#['4','L','e','a','n']) (by aesop))
#guard insert (#['L','e','a','n']) (4) (#['4']) (1) (4) (by aesop) = (#['L','e','a','n','4'])

-- Test case 4
#guard insert_precond (#['T','e','s','t']) (4) (#[]) (0) (2)
#guard insert_postcond (#['T','e','s','t']) (4) (#[]) (0) (2) (#['T','e','s','t']) (by aesop)
#guard ¬(insert_postcond (#['T','e','s','t']) (4) (#[]) (0) (2) (#['T','e','s']) (by aesop))
#guard ¬(insert_postcond (#['T','e','s','t']) (4) (#[]) (0) (2) (#['T','s','t','e']) (by aesop))
#guard ¬(insert_postcond (#['T','e','s','t']) (4) (#[]) (0) (2) (#['t','e','s','T']) (by aesop))
#guard insert (#['T','e','s','t']) (4) (#[]) (0) (2) (by aesop) = (#['T','e','s','t'])

-- Test case 5
#guard insert_precond (#['1','2','3','4','5','6']) (5) (#['a','b','c']) (3) (3)
#guard insert_postcond (#['1','2','3','4','5','6']) (5) (#['a','b','c']) (3) (3) (#['1','2','3','a','b','c','4','5']) (by aesop)
#guard ¬(insert_postcond (#['1','2','3','4','5','6']) (5) (#['a','b','c']) (3) (3) (#['1','2','3','a','b','c','4','5','6']) (by aesop))
#guard ¬(insert_postcond (#['1','2','3','4','5','6']) (5) (#['a','b','c']) (3) (3) (#['1','2','3','4','a','b','c','5','6']) (by aesop))
#guard ¬(insert_postcond (#['1','2','3','4','5','6']) (5) (#['a','b','c']) (3) (3) (#['1','2','3','a','b','4','c','5','6']) (by aesop))
#guard insert (#['1','2','3','4','5','6']) (5) (#['a','b','c']) (3) (3) (by aesop) = (#['1','2','3','a','b','c','4','5'])
