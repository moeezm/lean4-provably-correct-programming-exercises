import Aesop

/-
-----Description-----  
This task is about processing an array of integers by producing a new array
that excludes the first element. The objective is to define a clear behavior: if
the array contains at least one element, return a modified array starting from
the second element.

-----Input-----  
The input consists of:  
• a: An array of integers.

-----Output-----  
The output is an array of integers that:  
• Has a length equal to the original array's length minus one.  
• Contains the same elements as the input array except for the first element.  
• Satisfies the condition that for every index i in the output array, the
element at position i is equal to the element at position i+1 in the input
array.

-----Note-----  
It is assumed that the input array is non-empty.
-/

@[reducible, simp]
def remove_front_precond (a : Array Int) : Prop := sorry

def remove_front (a : Array Int) (h_precond : remove_front_precond a) : Array Int := sorry

@[reducible, simp]
def remove_front_postcond (a : Array Int) (result : Array Int) (h_precond : remove_front_precond a) : Prop := sorry

theorem remove_front_spec_satisfied (a : Array Int) (h_precond : remove_front_precond a) :
    remove_front_postcond a (remove_front a h_precond) h_precond := by
  sorry

-- Test Guards

-- Rejected inputs
#guard ¬(remove_front_precond (#[]))

-- Test case 1
#guard remove_front_precond (#[1, 2, 3, 4, 5])
#guard remove_front_postcond (#[1, 2, 3, 4, 5]) (#[2, 3, 4, 5]) (by aesop)
#guard ¬(remove_front_postcond (#[1, 2, 3, 4, 5]) (#[1, 2, 3, 4, 5]) (by aesop))
#guard ¬(remove_front_postcond (#[1, 2, 3, 4, 5]) (#[3, 4, 5]) (by aesop))
#guard ¬(remove_front_postcond (#[1, 2, 3, 4, 5]) (#[2, 3, 4]) (by aesop))
#guard remove_front (#[1, 2, 3, 4, 5]) (by aesop) = (#[2, 3, 4, 5])

-- Test case 2
#guard remove_front_precond (#[10, 20, 30])
#guard remove_front_postcond (#[10, 20, 30]) (#[20, 30]) (by aesop)
#guard ¬(remove_front_postcond (#[10, 20, 30]) (#[10, 20, 30]) (by aesop))
#guard ¬(remove_front_postcond (#[10, 20, 30]) (#[10, 30]) (by aesop))
#guard ¬(remove_front_postcond (#[10, 20, 30]) (#[10, 20]) (by aesop))
#guard remove_front (#[10, 20, 30]) (by aesop) = (#[20, 30])

-- Test case 3
#guard remove_front_precond (#[0, -1, -2, -3])
#guard remove_front_postcond (#[0, -1, -2, -3]) (#[-1, -2, -3]) (by aesop)
#guard ¬(remove_front_postcond (#[0, -1, -2, -3]) (#[0, -1, -2, -3]) (by aesop))
#guard ¬(remove_front_postcond (#[0, -1, -2, -3]) (#[-1, -3]) (by aesop))
#guard ¬(remove_front_postcond (#[0, -1, -2, -3]) (#[-2, -3]) (by aesop))
#guard remove_front (#[0, -1, -2, -3]) (by aesop) = (#[-1, -2, -3])

-- Test case 4
#guard remove_front_precond (#[7])
#guard remove_front_postcond (#[7]) (#[]) (by aesop)
#guard ¬(remove_front_postcond (#[7]) (#[7]) (by aesop))
#guard ¬(remove_front_postcond (#[7]) (#[0]) (by aesop))
#guard ¬(remove_front_postcond (#[7]) (#[7, 7]) (by aesop))
#guard remove_front (#[7]) (by aesop) = (#[])

-- Test case 5
#guard remove_front_precond (#[100, 0, 50])
#guard remove_front_postcond (#[100, 0, 50]) (#[0, 50]) (by aesop)
#guard ¬(remove_front_postcond (#[100, 0, 50]) (#[100, 0, 50]) (by aesop))
#guard ¬(remove_front_postcond (#[100, 0, 50]) (#[50]) (by aesop))
#guard ¬(remove_front_postcond (#[100, 0, 50]) (#[0]) (by aesop))
#guard remove_front (#[100, 0, 50]) (by aesop) = (#[0, 50])
