import Aesop

/-
-----Description-----  
The problem asks you to construct a new list by adding an extra number to the
end of an existing list of numbers. The focus is on understanding what the final
list should look like when a given number is included as the last element.

-----Input-----  
The input consists of:  
• a: An array of integers.  
• b: An integer to be appended to the array.

-----Output-----  
The output is an array of integers which represents the original array with the
element b added at the end. That is, the output array’s list representation
equals a.toList concatenated with [b].

-----Note-----  
There are no special preconditions; the method is expected to work correctly
for any array of integers and any integer b.
-/

@[reducible, simp]
def append_precond (a : Array Int) (b : Int) : Prop := sorry

def append (a : Array Int) (b : Int) (h_precond : append_precond a b) : Array Int := sorry

@[reducible, simp]
def append_postcond (a : Array Int) (b : Int) (result : Array Int) (h_precond : append_precond a b) : Prop := sorry

theorem append_spec_satisfied (a : Array Int) (b : Int) (h_precond : append_precond a b) :
    append_postcond a b (append a b h_precond) h_precond := by
  sorry

-- Test Guards

-- Test case 1
#guard append_precond (#[1, 2, 3]) (4)
#guard append_postcond (#[1, 2, 3]) (4) (#[1, 2, 3, 4]) (by aesop)
#guard ¬(append_postcond (#[1, 2, 3]) (4) (#[1, 2, 3, 0]) (by aesop))
#guard ¬(append_postcond (#[1, 2, 3]) (4) (#[1, 2, 4, 3]) (by aesop))
#guard ¬(append_postcond (#[1, 2, 3]) (4) (#[4, 1, 2, 3]) (by aesop))
#guard append (#[1, 2, 3]) (4) (by aesop) = (#[1, 2, 3, 4])

-- Test case 2
#guard append_precond (#[]) (0)
#guard append_postcond (#[]) (0) (#[0]) (by aesop)
#guard ¬(append_postcond (#[]) (0) (#[1]) (by aesop))
#guard ¬(append_postcond (#[]) (0) (#[]) (by aesop))
#guard ¬(append_postcond (#[]) (0) (#[0, 0]) (by aesop))
#guard append (#[]) (0) (by aesop) = (#[0])

-- Test case 3
#guard append_precond (#[5, 6]) (-1)
#guard append_postcond (#[5, 6]) (-1) (#[5, 6, -1]) (by aesop)
#guard ¬(append_postcond (#[5, 6]) (-1) (#[5, -1, 6]) (by aesop))
#guard ¬(append_postcond (#[5, 6]) (-1) (#[5, 6, 0]) (by aesop))
#guard ¬(append_postcond (#[5, 6]) (-1) (#[6, 5, -1]) (by aesop))
#guard append (#[5, 6]) (-1) (by aesop) = (#[5, 6, -1])

-- Test case 4
#guard append_precond (#[0, 0, 0]) (1)
#guard append_postcond (#[0, 0, 0]) (1) (#[0, 0, 0, 1]) (by aesop)
#guard ¬(append_postcond (#[0, 0, 0]) (1) (#[1, 0, 0, 0]) (by aesop))
#guard ¬(append_postcond (#[0, 0, 0]) (1) (#[0, 1, 0, 0]) (by aesop))
#guard ¬(append_postcond (#[0, 0, 0]) (1) (#[0, 0, 1, 0]) (by aesop))
#guard append (#[0, 0, 0]) (1) (by aesop) = (#[0, 0, 0, 1])

-- Test case 5
#guard append_precond (#[-2, -3]) (-4)
#guard append_postcond (#[-2, -3]) (-4) (#[-2, -3, -4]) (by aesop)
#guard ¬(append_postcond (#[-2, -3]) (-4) (#[-2, -4, -3]) (by aesop))
#guard ¬(append_postcond (#[-2, -3]) (-4) (#[-2, -3, 0]) (by aesop))
#guard ¬(append_postcond (#[-2, -3]) (-4) (#[-3, -2, -4]) (by aesop))
#guard append (#[-2, -3]) (-4) (by aesop) = (#[-2, -3, -4])
