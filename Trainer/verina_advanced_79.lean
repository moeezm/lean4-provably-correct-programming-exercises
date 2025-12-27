import Aesop

/-
-----Description-----
This task requires writing a Lean 4 method that implementing the "Two Sum"
problem. Given a list of integers
and a target integer, the function should return the indices of the two numbers
that add up to
the target. If no valid pair exists, the function should return none. And the
indices returned must
be within the bounds of the list. If multiple pair exists, return the first
pair.

-----Input-----
- nums: A list of integers.
- target: An integer representing the target sum.

-----Output-----
- An option type containing a pair of natural numbers (indices) such that 
  nums[i] + nums[j] = target, if such a pair exists. Otherwise, it returns none.


-/

@[reducible, simp]
def twoSum_precond (nums : List Int) (target : Int) : Prop := sorry

def twoSum (nums : List Int) (target : Int) (h_precond : twoSum_precond nums target) : Option (Nat × Nat) := sorry

@[reducible, simp]
def twoSum_postcond (nums : List Int) (target : Int) (result : Option (Nat × Nat)) (h_precond : twoSum_precond nums target) : Prop := sorry

theorem twoSum_spec_satisfied (nums : List Int) (target : Int) (h_precond : twoSum_precond nums target) :
    twoSum_postcond nums target (twoSum nums target h_precond) h_precond := by
  sorry

-- Test Guards

-- Test case 1
#guard twoSum_precond ([2, 7, 11, 15]) (9)
#guard twoSum_postcond ([2, 7, 11, 15]) (9) ("some (0, 1)") (by aesop)
#guard ¬(twoSum_postcond ([2, 7, 11, 15]) (9) ("some (1, 2)") (by aesop))
#guard ¬(twoSum_postcond ([2, 7, 11, 15]) (9) ("none") (by aesop))
#guard twoSum ([2, 7, 11, 15]) (9) (by aesop) = ("some (0, 1)")

-- Test case 2
#guard twoSum_precond ([3, 2, 4]) (6)
#guard twoSum_postcond ([3, 2, 4]) (6) ("some (1, 2)") (by aesop)
#guard ¬(twoSum_postcond ([3, 2, 4]) (6) ("some (0, 2)") (by aesop))
#guard ¬(twoSum_postcond ([3, 2, 4]) (6) ("none") (by aesop))
#guard twoSum ([3, 2, 4]) (6) (by aesop) = ("some (1, 2)")

-- Test case 3
#guard twoSum_precond ([3, 3]) (6)
#guard twoSum_postcond ([3, 3]) (6) ("some (0, 1)") (by aesop)
#guard ¬(twoSum_postcond ([3, 3]) (6) ("some (1, 1)") (by aesop))
#guard ¬(twoSum_postcond ([3, 3]) (6) ("none") (by aesop))
#guard twoSum ([3, 3]) (6) (by aesop) = ("some (0, 1)")

-- Test case 4
#guard twoSum_precond ([1, 2, 3]) (7)
#guard twoSum_postcond ([1, 2, 3]) (7) ("none") (by aesop)
#guard ¬(twoSum_postcond ([1, 2, 3]) (7) ("some (0, 2)") (by aesop))
#guard twoSum ([1, 2, 3]) (7) (by aesop) = ("none")

-- Test case 5
#guard twoSum_precond ([0, 4, 3, 0]) (0)
#guard twoSum_postcond ([0, 4, 3, 0]) (0) ("some (0, 3)") (by aesop)
#guard ¬(twoSum_postcond ([0, 4, 3, 0]) (0) ("some (1, 2)") (by aesop))
#guard ¬(twoSum_postcond ([0, 4, 3, 0]) (0) ("none") (by aesop))
#guard twoSum ([0, 4, 3, 0]) (0) (by aesop) = ("some (0, 3)")
