import Aesop

/-
-----Description-----  
This task involves determining whether a specified key appears exactly once in
an array. The goal is to verify the uniqueness of the key's occurrence without
prescribing any specific approach or implementation method.

-----Input-----  
The input consists of:  
• a: An array of integers.  
• key: An integer representing the element whose occurrence is to be checked.

-----Output-----  
The output is a Boolean value that:  
• Is true if the key appears exactly once in the array.  
• Is false otherwise.

-----Note-----  
The function should correctly handle arrays with no occurrences of the key,
multiple occurrences, and exactly one occurrence.
-/

@[reducible, simp]
def only_once_precond (a : Array Int) (key : Int) : Prop := sorry

def only_once (a : Array Int) (key : Int) (h_precond : only_once_precond a key) : Bool := sorry

@[reducible, simp]
def only_once_postcond (a : Array Int) (key : Int) (result : Bool) (h_precond : only_once_precond a key) : Prop := sorry

theorem only_once_spec_satisfied (a : Array Int) (key : Int) (h_precond : only_once_precond a key) :
    only_once_postcond a key (only_once a key h_precond) h_precond := by
  sorry

-- Test Guards

-- Test case 1
#guard only_once_precond (#[1, 2, 3, 4]) (2)
#guard only_once_postcond (#[1, 2, 3, 4]) (2) ("true") (by aesop)
#guard ¬(only_once_postcond (#[1, 2, 3, 4]) (2) (false) (by aesop))
#guard only_once (#[1, 2, 3, 4]) (2) (by aesop) = ("true")

-- Test case 2
#guard only_once_precond (#[1, 2, 2, 3, 4]) (2)
#guard only_once_postcond (#[1, 2, 2, 3, 4]) (2) ("false") (by aesop)
#guard ¬(only_once_postcond (#[1, 2, 2, 3, 4]) (2) (true) (by aesop))
#guard only_once (#[1, 2, 2, 3, 4]) (2) (by aesop) = ("false")

-- Test case 3
#guard only_once_precond (#[1, 1, 1, 1]) (1)
#guard only_once_postcond (#[1, 1, 1, 1]) (1) ("false") (by aesop)
#guard ¬(only_once_postcond (#[1, 1, 1, 1]) (1) (true) (by aesop))
#guard only_once (#[1, 1, 1, 1]) (1) (by aesop) = ("false")

-- Test case 4
#guard only_once_precond (#[10]) (10)
#guard only_once_postcond (#[10]) (10) ("true") (by aesop)
#guard ¬(only_once_postcond (#[10]) (10) (false) (by aesop))
#guard only_once (#[10]) (10) (by aesop) = ("true")

-- Test case 5
#guard only_once_precond (#[]) (5)
#guard only_once_postcond (#[]) (5) ("false") (by aesop)
#guard ¬(only_once_postcond (#[]) (5) (true) (by aesop))
#guard only_once (#[]) (5) (by aesop) = ("false")
