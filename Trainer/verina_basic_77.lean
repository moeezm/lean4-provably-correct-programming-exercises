import Aesop

/-
-----Description-----  
This task involves updating an element within a 2-dimensional array. The goal
is to modify only a specific inner array by changing one of its elements to a
new value while keeping every other element and all other inner arrays
unchanged.

-----Input-----  
The input consists of:  
• arr: An array of arrays of natural numbers.  
• index1: A natural number representing the index in the outer array
identifying which inner array to modify (0-indexed).
• index2: A natural number representing the index within the selected inner
array that should be updated (0-indexed).
• val: A natural number which is the new value to set at the specified inner
index.

-----Output-----  
The output is an array of arrays of natural numbers that:  
• Has the same overall structure as the input.  
• Contains all original inner arrays unchanged except for the inner array at
position index1.
• In the modified inner array, only the element at index2 is replaced with val,
while all other elements remain the same.

-----Note-----  
It is assumed that index1 is a valid index for the outer array and that index2
is a valid index within the corresponding inner array.
-/

@[reducible, simp]
def modify_array_element_precond (arr : Array (Array Nat)) (index1 : Nat) (index2 : Nat) (val : Nat) : Prop := sorry

def modify_array_element (arr : Array (Array Nat)) (index1 : Nat) (index2 : Nat) (val : Nat) (h_precond : modify_array_element_precond arr index1 index2 val) : Array (Array Nat) := sorry

@[reducible, simp]
def modify_array_element_postcond (arr : Array (Array Nat)) (index1 : Nat) (index2 : Nat) (val : Nat) (result : Array (Array Nat)) (h_precond : modify_array_element_precond arr index1 index2 val) : Prop := sorry

theorem modify_array_element_spec_satisfied (arr : Array (Array Nat)) (index1 : Nat) (index2 : Nat) (val : Nat) (h_precond : modify_array_element_precond arr index1 index2 val) :
    modify_array_element_postcond arr index1 index2 val (modify_array_element arr index1 index2 val h_precond) h_precond := by
  sorry

-- Test Guards

-- Rejected inputs
#guard ¬(modify_array_element_precond (#[#[1, 2, 3], #[4, 5, 6]]) (1) (3) (99))

-- Test case 1
#guard modify_array_element_precond (#[#[1, 2, 3], #[4, 5, 6]]) (0) (1) (99)
#guard modify_array_element_postcond (#[#[1, 2, 3], #[4, 5, 6]]) (0) (1) (99) (#[#[1, 99, 3], #[4, 5, 6]]) (by aesop)
#guard ¬(modify_array_element_postcond (#[#[1, 2, 3], #[4, 5, 6]]) (0) (1) (99) (#[#[1, 2, 3], #[4, 99, 6]]) (by aesop))
#guard ¬(modify_array_element_postcond (#[#[1, 2, 3], #[4, 5, 6]]) (0) (1) (99) (#[#[1, 99, 3], #[4, 5, 7]]) (by aesop))
#guard ¬(modify_array_element_postcond (#[#[1, 2, 3], #[4, 5, 6]]) (0) (1) (99) (#[#[99, 1, 3], #[4, 5, 6]]) (by aesop))
#guard modify_array_element (#[#[1, 2, 3], #[4, 5, 6]]) (0) (1) (99) (by aesop) = (#[#[1, 99, 3], #[4, 5, 6]])

-- Test case 2
#guard modify_array_element_precond (#[#[7, 8], #[9, 10]]) (1) (0) (0)
#guard modify_array_element_postcond (#[#[7, 8], #[9, 10]]) (1) (0) (0) (#[#[7, 8], #[0, 10]]) (by aesop)
#guard ¬(modify_array_element_postcond (#[#[7, 8], #[9, 10]]) (1) (0) (0) (#[#[7, 0], #[9, 10]]) (by aesop))
#guard ¬(modify_array_element_postcond (#[#[7, 8], #[9, 10]]) (1) (0) (0) (#[#[7, 8], #[9, 0]]) (by aesop))
#guard ¬(modify_array_element_postcond (#[#[7, 8], #[9, 10]]) (1) (0) (0) (#[#[0, 8], #[9, 10]]) (by aesop))
#guard modify_array_element (#[#[7, 8], #[9, 10]]) (1) (0) (0) (by aesop) = (#[#[7, 8], #[0, 10]])

-- Test case 3
#guard modify_array_element_precond (#[#[0, 0, 0]]) (0) (2) (5)
#guard modify_array_element_postcond (#[#[0, 0, 0]]) (0) (2) (5) (#[#[0, 0, 5]]) (by aesop)
#guard ¬(modify_array_element_postcond (#[#[0, 0, 0]]) (0) (2) (5) (#[#[0, 5, 0]]) (by aesop))
#guard ¬(modify_array_element_postcond (#[#[0, 0, 0]]) (0) (2) (5) (#[#[5, 0, 0]]) (by aesop))
#guard modify_array_element (#[#[0, 0, 0]]) (0) (2) (5) (by aesop) = (#[#[0, 0, 5]])

-- Test case 4
#guard modify_array_element_precond (#[#[3, 4, 5], #[6, 7, 8], #[9, 10, 11]]) (2) (1) (100)
#guard modify_array_element_postcond (#[#[3, 4, 5], #[6, 7, 8], #[9, 10, 11]]) (2) (1) (100) (#[#[3, 4, 5], #[6, 7, 8], #[9, 100, 11]]) (by aesop)
#guard ¬(modify_array_element_postcond (#[#[3, 4, 5], #[6, 7, 8], #[9, 10, 11]]) (2) (1) (100) (#[#[3, 4, 5], #[6, 7, 8], #[9, 10, 11]]) (by aesop))
#guard ¬(modify_array_element_postcond (#[#[3, 4, 5], #[6, 7, 8], #[9, 10, 11]]) (2) (1) (100) (#[#[3, 4, 5], #[6, 7, 8], #[9, 7, 11]]) (by aesop))
#guard ¬(modify_array_element_postcond (#[#[3, 4, 5], #[6, 7, 8], #[9, 10, 11]]) (2) (1) (100) (#[#[3, 4, 5], #[6, 7, 8], #[100, 10, 11]]) (by aesop))
#guard modify_array_element (#[#[3, 4, 5], #[6, 7, 8], #[9, 10, 11]]) (2) (1) (100) (by aesop) = (#[#[3, 4, 5], #[6, 7, 8], #[9, 100, 11]])

-- Test case 5
#guard modify_array_element_precond (#[#[1]]) (0) (0) (42)
#guard modify_array_element_postcond (#[#[1]]) (0) (0) (42) (#[#[42]]) (by aesop)
#guard ¬(modify_array_element_postcond (#[#[1]]) (0) (0) (42) (#[#[1]]) (by aesop))
#guard ¬(modify_array_element_postcond (#[#[1]]) (0) (0) (42) (#[#[0]]) (by aesop))
#guard ¬(modify_array_element_postcond (#[#[1]]) (0) (0) (42) (#[#[99]]) (by aesop))
#guard modify_array_element (#[#[1]]) (0) (0) (42) (by aesop) = (#[#[42]])
