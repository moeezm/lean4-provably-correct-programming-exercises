import Aesop

/-
-----Description-----  
The task is to determine the position of a target integer in a given array. The
goal is to return the index corresponding to the first occurrence of the target
value. If the target is not present in the array, the result should indicate
that by returning the size of the array. This description focuses entirely on
understanding the problem without specifying any particular implementation
method.

-----Input-----  
The input consists of:  
• a: An array of integers.  
• e: An integer representing the target to search for in the array.

-----Output-----  
The output is a natural number (Nat) which is:  
• The index of the first occurrence of the target integer if found.  
• The size of the array if the target integer is not present.  

-----Note-----  
There are no strict preconditions on the input; the method should work
correctly for any array of integers. The specification ensures that the returned
index is always valid: it is either within the array bounds with a matching
element or equals the array’s size if the element is absent.
-/

@[reducible, simp]
def LinearSearch_precond (a : Array Int) (e : Int) : Prop := sorry

def LinearSearch (a : Array Int) (e : Int) (h_precond : LinearSearch_precond a e) : Nat := sorry

@[reducible, simp]
def LinearSearch_postcond (a : Array Int) (e : Int) (result : Nat) (h_precond : LinearSearch_precond a e) : Prop := sorry

theorem LinearSearch_spec_satisfied (a : Array Int) (e : Int) (h_precond : LinearSearch_precond a e) :
    LinearSearch_postcond a e (LinearSearch a e h_precond) h_precond := by
  sorry

-- Test Guards

-- Test case 1
#guard LinearSearch_precond (#[1, 3, 5, 7, 9]) (5)
#guard LinearSearch_postcond (#[1, 3, 5, 7, 9]) (5) ("2") (by aesop)
#guard ¬(LinearSearch_postcond (#[1, 3, 5, 7, 9]) (5) ("1") (by aesop))
#guard ¬(LinearSearch_postcond (#[1, 3, 5, 7, 9]) (5) ("3") (by aesop))
#guard ¬(LinearSearch_postcond (#[1, 3, 5, 7, 9]) (5) ("4") (by aesop))
#guard LinearSearch (#[1, 3, 5, 7, 9]) (5) (by aesop) = ("2")

-- Test case 2
#guard LinearSearch_precond (#[2, 4, 6, 8]) (5)
#guard LinearSearch_postcond (#[2, 4, 6, 8]) (5) ("4") (by aesop)
#guard ¬(LinearSearch_postcond (#[2, 4, 6, 8]) (5) ("1") (by aesop))
#guard ¬(LinearSearch_postcond (#[2, 4, 6, 8]) (5) ("3") (by aesop))
#guard ¬(LinearSearch_postcond (#[2, 4, 6, 8]) (5) ("5") (by aesop))
#guard LinearSearch (#[2, 4, 6, 8]) (5) (by aesop) = ("4")

-- Test case 3
#guard LinearSearch_precond (#[5, 5, 5]) (5)
#guard LinearSearch_postcond (#[5, 5, 5]) (5) ("0") (by aesop)
#guard ¬(LinearSearch_postcond (#[5, 5, 5]) (5) ("1") (by aesop))
#guard ¬(LinearSearch_postcond (#[5, 5, 5]) (5) ("2") (by aesop))
#guard ¬(LinearSearch_postcond (#[5, 5, 5]) (5) ("3") (by aesop))
#guard LinearSearch (#[5, 5, 5]) (5) (by aesop) = ("0")

-- Test case 4
#guard LinearSearch_precond (#[10, 9, 8, 7]) (10)
#guard LinearSearch_postcond (#[10, 9, 8, 7]) (10) ("0") (by aesop)
#guard ¬(LinearSearch_postcond (#[10, 9, 8, 7]) (10) ("1") (by aesop))
#guard ¬(LinearSearch_postcond (#[10, 9, 8, 7]) (10) ("2") (by aesop))
#guard ¬(LinearSearch_postcond (#[10, 9, 8, 7]) (10) ("3") (by aesop))
#guard LinearSearch (#[10, 9, 8, 7]) (10) (by aesop) = ("0")

-- Test case 5
#guard LinearSearch_precond (#[1, 2, 3, 3, 4]) (3)
#guard LinearSearch_postcond (#[1, 2, 3, 3, 4]) (3) ("2") (by aesop)
#guard ¬(LinearSearch_postcond (#[1, 2, 3, 3, 4]) (3) ("1") (by aesop))
#guard ¬(LinearSearch_postcond (#[1, 2, 3, 3, 4]) (3) ("3") (by aesop))
#guard ¬(LinearSearch_postcond (#[1, 2, 3, 3, 4]) (3) ("4") (by aesop))
#guard LinearSearch (#[1, 2, 3, 3, 4]) (3) (by aesop) = ("2")
