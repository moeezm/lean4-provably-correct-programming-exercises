import Aesop

/-
-----Description-----
This task requires writing a Lean 4 function that takes a list of integers and
returns a new list. For each index i in the input list, the output at i is equal
to the product of all numbers in the list except the number at index i. The
solution must run in O(n) time without using the division operation.

-----Input-----
The input is a list of integers. For example, [1,2,3,4].

-----Output-----
The output is a list of integers where each element at index i is the product
of every input element except the one at that index. For example, for the input
[1,2,3,4], the output should be [24,12,8,6]. Each intermediate product is
guaranteed to fit in a 32-bit integer.


-/

@[reducible, simp]
def productExceptSelf_precond (nums : List Int) : Prop := sorry

def productExceptSelf (nums : List Int) (h_precond : productExceptSelf_precond nums) : List Int := sorry

@[reducible, simp]
def productExceptSelf_postcond (nums : List Int) (result : List Int) (h_precond : productExceptSelf_precond nums) : Prop := sorry

theorem productExceptSelf_spec_satisfied (nums : List Int) (h_precond : productExceptSelf_precond nums) :
    productExceptSelf_postcond nums (productExceptSelf nums h_precond) h_precond := by
  sorry

-- Test Guards

-- Test case 1
#guard productExceptSelf_precond ([1, 2, 3, 4])
#guard productExceptSelf_postcond ([1, 2, 3, 4]) ([24, 12, 8, 6]) (by aesop)
#guard ¬(productExceptSelf_postcond ([1, 2, 3, 4]) ([24, 12, 8, 0]) (by aesop))
#guard ¬(productExceptSelf_postcond ([1, 2, 3, 4]) ([1, 2, 3, 4]) (by aesop))
#guard productExceptSelf ([1, 2, 3, 4]) (by aesop) = ([24, 12, 8, 6])

-- Test case 2
#guard productExceptSelf_precond ([-1, 1, 0, -3, 3])
#guard productExceptSelf_postcond ([-1, 1, 0, -3, 3]) ([0, 0, 9, 0, 0]) (by aesop)
#guard ¬(productExceptSelf_postcond ([-1, 1, 0, -3, 3]) ([0, 0, 0, 0, 0]) (by aesop))
#guard productExceptSelf ([-1, 1, 0, -3, 3]) (by aesop) = ([0, 0, 9, 0, 0])

-- Test case 3
#guard productExceptSelf_precond ([2, 3])
#guard productExceptSelf_postcond ([2, 3]) ([3, 2]) (by aesop)
#guard ¬(productExceptSelf_postcond ([2, 3]) ([6]) (by aesop))
#guard ¬(productExceptSelf_postcond ([2, 3]) ([6, 6]) (by aesop))
#guard productExceptSelf ([2, 3]) (by aesop) = ([3, 2])

-- Test case 4
#guard productExceptSelf_precond ([5, 5, 5, 5])
#guard productExceptSelf_postcond ([5, 5, 5, 5]) ([125, 125, 125, 125]) (by aesop)
#guard ¬(productExceptSelf_postcond ([5, 5, 5, 5]) ([5]) (by aesop))
#guard ¬(productExceptSelf_postcond ([5, 5, 5, 5]) ([25, 25, 25, 25]) (by aesop))
#guard productExceptSelf ([5, 5, 5, 5]) (by aesop) = ([125, 125, 125, 125])

-- Test case 5
#guard productExceptSelf_precond ([0, 1, 2])
#guard productExceptSelf_postcond ([0, 1, 2]) ([2, 0, 0]) (by aesop)
#guard ¬(productExceptSelf_postcond ([0, 1, 2]) ([2, 1, 0]) (by aesop))
#guard ¬(productExceptSelf_postcond ([0, 1, 2]) ([2, 0]) (by aesop))
#guard productExceptSelf ([0, 1, 2]) (by aesop) = ([2, 0, 0])
