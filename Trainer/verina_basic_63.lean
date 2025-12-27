import Aesop

/-
-----Description-----  
The task is to determine whether there exists at least one pair of different
floating-point numbers in a list such that the absolute difference between them
is less than a given threshold. The focus is solely on deciding if such a pair
is present in the list.

-----Input-----  
The input consists of:  
• numbers: A list of floating-point numbers.  
• threshold: A floating-point number representing the maximum allowed
difference between two numbers for them to be considered "close."

-----Output-----  
The output is a boolean value:  
• true – if there exists at least one pair of distinct elements in the list
such that the absolute difference between them is less than the threshold.
• false – if for every possible pair of elements, the absolute difference is
greater than or equal to the threshold.

-----Note-----  
It is assumed that the list of numbers is provided and that the threshold is
non-negative.
-/

@[reducible, simp]
def has_close_elements_precond (numbers : List Float) (threshold : Float) : Prop := sorry

def has_close_elements (numbers : List Float) (threshold : Float) (h_precond : has_close_elements_precond numbers threshold) : Bool := sorry

@[reducible, simp]
def has_close_elements_postcond (numbers : List Float) (threshold : Float) (result : Bool) (h_precond : has_close_elements_precond numbers threshold) : Prop := sorry

theorem has_close_elements_spec_satisfied (numbers : List Float) (threshold : Float) (h_precond : has_close_elements_precond numbers threshold) :
    has_close_elements_postcond numbers threshold (has_close_elements numbers threshold h_precond) h_precond := by
  sorry

-- Test Guards

-- Rejected inputs
#guard ¬(has_close_elements_precond ([1.0, 2.0, 3.0]) (-1.0))

-- Test case 1
#guard has_close_elements_precond ([1.0, 2.0, 3.0]) (1.5)
#guard has_close_elements_postcond ([1.0, 2.0, 3.0]) (1.5) (true) (by aesop)
#guard has_close_elements ([1.0, 2.0, 3.0]) (1.5) (by aesop) = (true)

-- Test case 2
#guard has_close_elements_precond ([10.0, 12.0, 15.0]) (1.5)
#guard has_close_elements_postcond ([10.0, 12.0, 15.0]) (1.5) (false) (by aesop)
#guard has_close_elements ([10.0, 12.0, 15.0]) (1.5) (by aesop) = (false)

-- Test case 3
#guard has_close_elements_precond ([5.0, 5.0]) (0.1)
#guard has_close_elements_postcond ([5.0, 5.0]) (0.1) (true) (by aesop)
#guard has_close_elements ([5.0, 5.0]) (0.1) (by aesop) = (true)

-- Test case 4
#guard has_close_elements_precond ([]) (2.0)
#guard has_close_elements_postcond ([]) (2.0) (false) (by aesop)
#guard has_close_elements ([]) (2.0) (by aesop) = (false)

-- Test case 5
#guard has_close_elements_precond ([0.0, 0.5, 1.1, 2.2]) (0.6)
#guard has_close_elements_postcond ([0.0, 0.5, 1.1, 2.2]) (0.6) (true) (by aesop)
#guard has_close_elements ([0.0, 0.5, 1.1, 2.2]) (0.6) (by aesop) = (true)
