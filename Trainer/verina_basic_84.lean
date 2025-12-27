import Aesop

/-
-----Description-----  
You are given an array of integers and a threshold value k. The problem is to
create a new array where every element greater than k is replaced with -1 while
every other element remains unchanged.

-----Input-----  
The input consists of:  
• arr: An array of integers.  
• k: An integer used as the threshold for replacement.

-----Output-----  
The output is an array of integers that satisfies the following conditions:  
• For every index i, if arr[i] is greater than k, then the returned array at
index i is -1.
• For every index i, if arr[i] is less than or equal to k, then the returned
array at index i remains unchanged.

-----Note-----  
It is assumed that the input array may be empty or non-empty, and that k can be
any integer. There are no additional preconditions.
-/

@[reducible, simp]
def replace_precond (arr : Array Int) (k : Int) : Prop := sorry

def replace (arr : Array Int) (k : Int) (h_precond : replace_precond arr k) : Array Int := sorry

@[reducible, simp]
def replace_postcond (arr : Array Int) (k : Int) (result : Array Int) (h_precond : replace_precond arr k) : Prop := sorry

theorem replace_spec_satisfied (arr : Array Int) (k : Int) (h_precond : replace_precond arr k) :
    replace_postcond arr k (replace arr k h_precond) h_precond := by
  sorry

-- Test Guards

-- Test case 1
#guard replace_precond (#[1, 5, 3, 10]) (4)
#guard replace_postcond (#[1, 5, 3, 10]) (4) (#[1, -1, 3, -1]) (by aesop)
#guard ¬(replace_postcond (#[1, 5, 3, 10]) (4) (#[1, 5, 3, 10]) (by aesop))
#guard ¬(replace_postcond (#[1, 5, 3, 10]) (4) (#[1, -1, 3, 10]) (by aesop))
#guard replace (#[1, 5, 3, 10]) (4) (by aesop) = (#[1, -1, 3, -1])

-- Test case 2
#guard replace_precond (#[-1, 0, 1, 2]) (2)
#guard replace_postcond (#[-1, 0, 1, 2]) (2) (#[-1, 0, 1, 2]) (by aesop)
#guard ¬(replace_postcond (#[-1, 0, 1, 2]) (2) (#[0, 0, 1, 2]) (by aesop))
#guard ¬(replace_postcond (#[-1, 0, 1, 2]) (2) (#[-1, 0, 1, 1]) (by aesop))
#guard replace (#[-1, 0, 1, 2]) (2) (by aesop) = (#[-1, 0, 1, 2])

-- Test case 3
#guard replace_precond (#[100, 50, 100]) (100)
#guard replace_postcond (#[100, 50, 100]) (100) (#[100, 50, 100]) (by aesop)
#guard ¬(replace_postcond (#[100, 50, 100]) (100) (#[100, 50, -1]) (by aesop))
#guard ¬(replace_postcond (#[100, 50, 100]) (100) (#[100, 50, 50]) (by aesop))
#guard replace (#[100, 50, 100]) (100) (by aesop) = (#[100, 50, 100])

-- Test case 4
#guard replace_precond (#[-5, -2, 0, 3]) (-3)
#guard replace_postcond (#[-5, -2, 0, 3]) (-3) (#[-5, -1, -1, -1]) (by aesop)
#guard ¬(replace_postcond (#[-5, -2, 0, 3]) (-3) (#[-5, -2, -1, -1]) (by aesop))
#guard ¬(replace_postcond (#[-5, -2, 0, 3]) (-3) (#[-5, -1, 0, -1]) (by aesop))
#guard replace (#[-5, -2, 0, 3]) (-3) (by aesop) = (#[-5, -1, -1, -1])

-- Test case 5
#guard replace_precond (#[1, 2, 3]) (5)
#guard replace_postcond (#[1, 2, 3]) (5) (#[1, 2, 3]) (by aesop)
#guard ¬(replace_postcond (#[1, 2, 3]) (5) (#[1, 3, 3]) (by aesop))
#guard ¬(replace_postcond (#[1, 2, 3]) (5) (#[1, 2, -1]) (by aesop))
#guard replace (#[1, 2, 3]) (5) (by aesop) = (#[1, 2, 3])
