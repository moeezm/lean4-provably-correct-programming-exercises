import Aesop

/-
-----Description-----  
This problem focuses on reversing an array of integers. The goal is to take an
input array and produce a new array with the elements arranged in the reverse
order.

-----Input-----  
The input consists of:  
• a: An array of integers, which may be empty, contain one element, or many
elements.

-----Output-----  
The output is an array of integers that:  
• Has the same length as the input array.  
• Contains the same elements as the input array, but in reverse order.  
• For every valid index i in the input array, the output at index i is equal to
the element at index (a.size - 1 - i) from the input array.

-----Note-----  
There are no specific preconditions; the method should correctly handle any
array of integers.
-/

@[reducible, simp]
def reverse_precond (a : Array Int) : Prop := sorry

def reverse (a : Array Int) (h_precond : reverse_precond a) : Array Int := sorry

@[reducible, simp]
def reverse_postcond (a : Array Int) (result : Array Int) (h_precond : reverse_precond a) : Prop := sorry

theorem reverse_spec_satisfied (a : Array Int) (h_precond : reverse_precond a) :
    reverse_postcond a (reverse a h_precond) h_precond := by
  sorry

-- Test Guards

-- Test case 1
#guard reverse_precond (#[1, 2, 3, 4, 5])
#guard reverse_postcond (#[1, 2, 3, 4, 5]) (#[5, 4, 3, 2, 1]) (by aesop)
#guard ¬(reverse_postcond (#[1, 2, 3, 4, 5]) (#[1, 2, 3, 4, 5]) (by aesop))
#guard ¬(reverse_postcond (#[1, 2, 3, 4, 5]) (#[5, 3, 4, 2, 1]) (by aesop))
#guard ¬(reverse_postcond (#[1, 2, 3, 4, 5]) (#[2, 3, 4, 5, 6]) (by aesop))
#guard reverse (#[1, 2, 3, 4, 5]) (by aesop) = (#[5, 4, 3, 2, 1])

-- Test case 2
#guard reverse_precond (#[10, 20, 30, 40])
#guard reverse_postcond (#[10, 20, 30, 40]) (#[40, 30, 20, 10]) (by aesop)
#guard ¬(reverse_postcond (#[10, 20, 30, 40]) (#[10, 20, 30, 40]) (by aesop))
#guard ¬(reverse_postcond (#[10, 20, 30, 40]) (#[40, 20, 30, 10]) (by aesop))
#guard ¬(reverse_postcond (#[10, 20, 30, 40]) (#[30, 20, 10, 40]) (by aesop))
#guard reverse (#[10, 20, 30, 40]) (by aesop) = (#[40, 30, 20, 10])

-- Test case 3
#guard reverse_precond (#[])
#guard reverse_postcond (#[]) (#[]) (by aesop)
#guard ¬(reverse_postcond (#[]) (#[0]) (by aesop))
#guard ¬(reverse_postcond (#[]) (#[-1]) (by aesop))
#guard ¬(reverse_postcond (#[]) (#[1]) (by aesop))
#guard reverse (#[]) (by aesop) = (#[])

-- Test case 4
#guard reverse_precond (#[7])
#guard reverse_postcond (#[7]) (#[7]) (by aesop)
#guard ¬(reverse_postcond (#[7]) (#[0]) (by aesop))
#guard ¬(reverse_postcond (#[7]) (#[7, 7]) (by aesop))
#guard ¬(reverse_postcond (#[7]) (#[1]) (by aesop))
#guard reverse (#[7]) (by aesop) = (#[7])

-- Test case 5
#guard reverse_precond (#[-1, 0, 1])
#guard reverse_postcond (#[-1, 0, 1]) (#[1, 0, -1]) (by aesop)
#guard ¬(reverse_postcond (#[-1, 0, 1]) (#[-1, 0, 1]) (by aesop))
#guard ¬(reverse_postcond (#[-1, 0, 1]) (#[0, 1, -1]) (by aesop))
#guard ¬(reverse_postcond (#[-1, 0, 1]) (#[1, -1, 0]) (by aesop))
#guard reverse (#[-1, 0, 1]) (by aesop) = (#[1, 0, -1])
