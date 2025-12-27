import Aesop

/-
-----Description-----  
The problem involves finding the first occurrence of a specified key in an
array of integers. Your task is to identify the index at which the key appears
for the first time in the array and return that index. If the key is not found,
return -1.

-----Input-----  
The input consists of:  
• a: An array of integers.  
• key: An integer representing the value to search for in the array.

-----Output-----  
The output is an integer which represents:  
• The index in the array where the key is found, provided that the index is in
the range [0, a.size).
• -1 if the key is not present in the array.  
In addition, if the output is not -1, then a[(Int.toNat result)]! equals key
and every element in the array prior to this index is not equal to key.

-----Note-----  
The function performs a linear search beginning at index 0 and returns the
first occurrence of the key. There are no additional preconditions on the input
array; it can be empty or non-empty.
-/

@[reducible, simp]
def Find_precond (a : Array Int) (key : Int) : Prop := sorry

def Find (a : Array Int) (key : Int) (h_precond : Find_precond a key) : Int := sorry

@[reducible, simp]
def Find_postcond (a : Array Int) (key : Int) (result : Int) (h_precond : Find_precond a key) : Prop := sorry

theorem Find_spec_satisfied (a : Array Int) (key : Int) (h_precond : Find_precond a key) :
    Find_postcond a key (Find a key h_precond) h_precond := by
  sorry

-- Test Guards

-- Test case 1
#guard Find_precond (#[1, 2, 3, 4, 5]) (3)
#guard Find_postcond (#[1, 2, 3, 4, 5]) (3) (2) (by aesop)
#guard ¬(Find_postcond (#[1, 2, 3, 4, 5]) (3) (1) (by aesop))
#guard ¬(Find_postcond (#[1, 2, 3, 4, 5]) (3) (3) (by aesop))
#guard ¬(Find_postcond (#[1, 2, 3, 4, 5]) (3) (0) (by aesop))
#guard Find (#[1, 2, 3, 4, 5]) (3) (by aesop) = (2)

-- Test case 2
#guard Find_precond (#[5, 7, 5, 9]) (5)
#guard Find_postcond (#[5, 7, 5, 9]) (5) (0) (by aesop)
#guard ¬(Find_postcond (#[5, 7, 5, 9]) (5) (2) (by aesop))
#guard ¬(Find_postcond (#[5, 7, 5, 9]) (5) (-1) (by aesop))
#guard Find (#[5, 7, 5, 9]) (5) (by aesop) = (0)

-- Test case 3
#guard Find_precond (#[2, 4, 6, 8]) (5)
#guard Find_postcond (#[2, 4, 6, 8]) (5) (-1) (by aesop)
#guard ¬(Find_postcond (#[2, 4, 6, 8]) (5) (0) (by aesop))
#guard ¬(Find_postcond (#[2, 4, 6, 8]) (5) (1) (by aesop))
#guard ¬(Find_postcond (#[2, 4, 6, 8]) (5) (3) (by aesop))
#guard Find (#[2, 4, 6, 8]) (5) (by aesop) = (-1)

-- Test case 4
#guard Find_precond (#[]) (10)
#guard Find_postcond (#[]) (10) (-1) (by aesop)
#guard ¬(Find_postcond (#[]) (10) (0) (by aesop))
#guard ¬(Find_postcond (#[]) (10) (1) (by aesop))
#guard ¬(Find_postcond (#[]) (10) (10) (by aesop))
#guard Find (#[]) (10) (by aesop) = (-1)

-- Test case 5
#guard Find_precond (#[0, -3, -1, -3]) (-3)
#guard Find_postcond (#[0, -3, -1, -3]) (-3) (1) (by aesop)
#guard ¬(Find_postcond (#[0, -3, -1, -3]) (-3) (0) (by aesop))
#guard ¬(Find_postcond (#[0, -3, -1, -3]) (-3) (2) (by aesop))
#guard ¬(Find_postcond (#[0, -3, -1, -3]) (-3) (3) (by aesop))
#guard Find (#[0, -3, -1, -3]) (-3) (by aesop) = (1)
