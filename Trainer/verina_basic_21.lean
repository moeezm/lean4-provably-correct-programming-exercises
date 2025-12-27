import Aesop

/-
-----Description-----  
This task requires writing a Lean 4 method that determines whether one list is
a sublist of another. In other words, the method should check if the first list
appears as a contiguous sequence within the second list and return true if it
does, and false otherwise.

-----Input-----  
The input consists of two lists of integers:  
sub: A list of integers representing the potential sublist.  
main: A list of integers in which to search for the sublist.

-----Output-----  
The output is a Boolean value:  
Returns true if the first list appears as a contiguous sequence within the
second list.
Returns false if the first list does not appear as a contiguous sequence in the
second list.

-----Note-----  
There are no preconditions for this method; the sequences are always non-null.
-/

@[reducible, simp]
def isSublist_precond (sub : List Int) (main : List Int) : Prop := sorry

def isSublist (sub : List Int) (main : List Int) (h_precond : isSublist_precond sub main) : Bool := sorry

@[reducible, simp]
def isSublist_postcond (sub : List Int) (main : List Int) (result : Bool) (h_precond : isSublist_precond sub main) : Prop := sorry

theorem isSublist_spec_satisfied (sub : List Int) (main : List Int) (h_precond : isSublist_precond sub main) :
    isSublist_postcond sub main (isSublist sub main h_precond) h_precond := by
  sorry

-- Test Guards

-- Test case 1
#guard isSublist_precond ([1, 2]) ([3, 1, 2, 4])
#guard isSublist_postcond ([1, 2]) ([3, 1, 2, 4]) (true) (by aesop)
#guard ¬(isSublist_postcond ([1, 2]) ([3, 1, 2, 4]) (false) (by aesop))
#guard isSublist ([1, 2]) ([3, 1, 2, 4]) (by aesop) = (true)

-- Test case 2
#guard isSublist_precond ([2, 3]) ([3, 1, 2, 4])
#guard isSublist_postcond ([2, 3]) ([3, 1, 2, 4]) (false) (by aesop)
#guard ¬(isSublist_postcond ([2, 3]) ([3, 1, 2, 4]) (true) (by aesop))
#guard isSublist ([2, 3]) ([3, 1, 2, 4]) (by aesop) = (false)

-- Test case 3
#guard isSublist_precond ([3, 1]) ([3, 1, 2, 4])
#guard isSublist_postcond ([3, 1]) ([3, 1, 2, 4]) (true) (by aesop)
#guard ¬(isSublist_postcond ([3, 1]) ([3, 1, 2, 4]) (false) (by aesop))
#guard isSublist ([3, 1]) ([3, 1, 2, 4]) (by aesop) = (true)

-- Test case 4
#guard isSublist_precond ([4]) ([3, 1, 2, 4])
#guard isSublist_postcond ([4]) ([3, 1, 2, 4]) (true) (by aesop)
#guard ¬(isSublist_postcond ([4]) ([3, 1, 2, 4]) (false) (by aesop))
#guard isSublist ([4]) ([3, 1, 2, 4]) (by aesop) = (true)

-- Test case 5
#guard isSublist_precond ([5]) ([3, 1, 2, 4])
#guard isSublist_postcond ([5]) ([3, 1, 2, 4]) (false) (by aesop)
#guard ¬(isSublist_postcond ([5]) ([3, 1, 2, 4]) (true) (by aesop))
#guard isSublist ([5]) ([3, 1, 2, 4]) (by aesop) = (false)

-- Test case 6
#guard isSublist_precond ([]) ([3, 1, 2, 4])
#guard isSublist_postcond ([]) ([3, 1, 2, 4]) (true) (by aesop)
#guard ¬(isSublist_postcond ([]) ([3, 1, 2, 4]) (false) (by aesop))
#guard isSublist ([]) ([3, 1, 2, 4]) (by aesop) = (true)

-- Test case 7
#guard isSublist_precond ([1, 2]) ([])
#guard isSublist_postcond ([1, 2]) ([]) (false) (by aesop)
#guard ¬(isSublist_postcond ([1, 2]) ([]) (true) (by aesop))
#guard isSublist ([1, 2]) ([]) (by aesop) = (false)

-- Test case 8
#guard isSublist_precond ([]) ([])
#guard isSublist_postcond ([]) ([]) (true) (by aesop)
#guard ¬(isSublist_postcond ([]) ([]) (false) (by aesop))
#guard isSublist ([]) ([]) (by aesop) = (true)
