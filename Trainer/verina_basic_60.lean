import Aesop

/-
-----Description-----  
This task requires writing a function that processes an array of integers and
produces a new array containing only the even numbers from the input. The order
of these even numbers should remain the same as in the original array, ensuring
that every even number from the input appears in the output and that every
element in the output is even.

-----Input-----  
The input consists of one parameter:  
• arr: An array of integers.

-----Output-----  
The output is an array of integers that:  
• Contains exactly all even numbers from the input array, preserving their
original order.
• Meets the specified conditions that ensure no extraneous (odd or
non-existing) elements are returned.

-----Note-----  
There are no additional preconditions. The function must adhere to the provided
specification which enforces evenness and order preservation for the elements in
the output array.
-/

@[reducible, simp]
def FindEvenNumbers_precond (arr : Array Int) : Prop := sorry

def FindEvenNumbers (arr : Array Int) (h_precond : FindEvenNumbers_precond arr) : Array Int := sorry

@[reducible, simp]
def FindEvenNumbers_postcond (arr : Array Int) (result : Array Int) (h_precond : FindEvenNumbers_precond arr) : Prop := sorry

theorem FindEvenNumbers_spec_satisfied (arr : Array Int) (h_precond : FindEvenNumbers_precond arr) :
    FindEvenNumbers_postcond arr (FindEvenNumbers arr h_precond) h_precond := by
  sorry

-- Test Guards

-- Test case 1
#guard FindEvenNumbers_precond (#[1, 2, 3, 4, 5, 6])
#guard FindEvenNumbers_postcond (#[1, 2, 3, 4, 5, 6]) (#[2, 4, 6]) (by aesop)
#guard ¬(FindEvenNumbers_postcond (#[1, 2, 3, 4, 5, 6]) (#[2, 4, 5]) (by aesop))
#guard ¬(FindEvenNumbers_postcond (#[1, 2, 3, 4, 5, 6]) (#[1, 2, 3, 4]) (by aesop))
#guard ¬(FindEvenNumbers_postcond (#[1, 2, 3, 4, 5, 6]) (#[2, 3, 6]) (by aesop))
#guard FindEvenNumbers (#[1, 2, 3, 4, 5, 6]) (by aesop) = (#[2, 4, 6])

-- Test case 2
#guard FindEvenNumbers_precond (#[0, -2, 3, -4, 7])
#guard FindEvenNumbers_postcond (#[0, -2, 3, -4, 7]) (#[0, -2, -4]) (by aesop)
#guard ¬(FindEvenNumbers_postcond (#[0, -2, 3, -4, 7]) (#[0, 3, -4]) (by aesop))
#guard ¬(FindEvenNumbers_postcond (#[0, -2, 3, -4, 7]) (#[0, -2, 3]) (by aesop))
#guard FindEvenNumbers (#[0, -2, 3, -4, 7]) (by aesop) = (#[0, -2, -4])

-- Test case 3
#guard FindEvenNumbers_precond (#[1, 3, 5, 7])
#guard FindEvenNumbers_postcond (#[1, 3, 5, 7]) (#[]) (by aesop)
#guard ¬(FindEvenNumbers_postcond (#[1, 3, 5, 7]) (#[1]) (by aesop))
#guard ¬(FindEvenNumbers_postcond (#[1, 3, 5, 7]) (#[0, 1]) (by aesop))
#guard FindEvenNumbers (#[1, 3, 5, 7]) (by aesop) = (#[])

-- Test case 4
#guard FindEvenNumbers_precond (#[2, 4, 8, 10])
#guard FindEvenNumbers_postcond (#[2, 4, 8, 10]) (#[2, 4, 8, 10]) (by aesop)
#guard ¬(FindEvenNumbers_postcond (#[2, 4, 8, 10]) (#[2, 4, 8, 9]) (by aesop))
#guard ¬(FindEvenNumbers_postcond (#[2, 4, 8, 10]) (#[2, 4, 8, 10, 12]) (by aesop))
#guard FindEvenNumbers (#[2, 4, 8, 10]) (by aesop) = (#[2, 4, 8, 10])

-- Test case 5
#guard FindEvenNumbers_precond (#[])
#guard FindEvenNumbers_postcond (#[]) (#[]) (by aesop)
#guard ¬(FindEvenNumbers_postcond (#[]) (#[0]) (by aesop))
#guard ¬(FindEvenNumbers_postcond (#[]) (#[1, 2]) (by aesop))
#guard FindEvenNumbers (#[]) (by aesop) = (#[])
