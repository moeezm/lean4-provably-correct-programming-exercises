import Aesop

/-
-----Description-----
Given a nonempty array of integers and a valid index x (with 1 ≤ x < array
size), the task is to identify two key pieces of information. First, determine
the maximum value among the first x elements of the array. Second, select an
index p within the range [x, array size) that satisfies the following
conditions: if there exists an element in the segment starting from index x that
is strictly greater than the previously determined maximum, then p should be the
index of the first such occurrence; otherwise, p should be set to the last index
of the array. The focus of the problem is solely on correctly identifying the
maximum and choosing the appropriate index based on these order conditions.

-----Input-----
The input consists of:
• a: An array of integers (assumed to be nonempty).
• x: A natural number (Nat) such that 1 ≤ x < a.size.

-----Output-----
The output is a pair (m, p) where:
• m is the maximum value among the first x elements of the array.
• p is an index in the array, with x ≤ p < a.size, determined based on the
ordering condition where a[p] is the first element (from index x onward) that is
strictly greater than m. If no such element exists, then p is set to a.size − 1.

-----Note-----
It is assumed that the array a is nonempty and that the parameter x meets the
precondition 1 ≤ x < a.size. The function relies on helper functions to compute
the maximum among the first x elements and to select the appropriate index p
based on the given conditions.
-/

@[reducible, simp]
def onlineMax_precond (a : Array Int) (x : Nat) : Prop := sorry

def onlineMax (a : Array Int) (x : Nat) (h_precond : onlineMax_precond a x) : Int × Nat := sorry

@[reducible, simp]
def onlineMax_postcond (a : Array Int) (x : Nat) (result : Int × Nat) (h_precond : onlineMax_precond a x) : Prop := sorry

theorem onlineMax_spec_satisfied (a : Array Int) (x : Nat) (h_precond : onlineMax_precond a x) :
    onlineMax_postcond a x (onlineMax a x h_precond) h_precond := by
  sorry

-- Test Guards

-- Rejected inputs
#guard ¬(onlineMax_precond (#[]) (2))

-- Test case 1
#guard onlineMax_precond (#[3, 7, 5, 2, 9]) (3)
#guard onlineMax_postcond (#[3, 7, 5, 2, 9]) (3) ("(7, 4)") (by aesop)
#guard ¬(onlineMax_postcond (#[3, 7, 5, 2, 9]) (3) ("(7, 3)") (by aesop))
#guard ¬(onlineMax_postcond (#[3, 7, 5, 2, 9]) (3) ("(5, 4)") (by aesop))
#guard onlineMax (#[3, 7, 5, 2, 9]) (3) (by aesop) = ("(7, 4)")

-- Test case 2
#guard onlineMax_precond (#[10, 10, 5, 1]) (2)
#guard onlineMax_postcond (#[10, 10, 5, 1]) (2) ("(10, 3)") (by aesop)
#guard ¬(onlineMax_postcond (#[10, 10, 5, 1]) (2) ("(10, 2)") (by aesop))
#guard ¬(onlineMax_postcond (#[10, 10, 5, 1]) (2) ("(7, 3)") (by aesop))
#guard onlineMax (#[10, 10, 5, 1]) (2) (by aesop) = ("(10, 3)")

-- Test case 3
#guard onlineMax_precond (#[1, 3, 3, 3, 1]) (2)
#guard onlineMax_postcond (#[1, 3, 3, 3, 1]) (2) ("(3, 4)") (by aesop)
#guard ¬(onlineMax_postcond (#[1, 3, 3, 3, 1]) (2) ("(2, 4)") (by aesop))
#guard ¬(onlineMax_postcond (#[1, 3, 3, 3, 1]) (2) ("(3, 3)") (by aesop))
#guard onlineMax (#[1, 3, 3, 3, 1]) (2) (by aesop) = ("(3, 4)")

-- Test case 4
#guard onlineMax_precond (#[5, 4, 4, 6, 2]) (2)
#guard onlineMax_postcond (#[5, 4, 4, 6, 2]) (2) ("(5, 3)") (by aesop)
#guard ¬(onlineMax_postcond (#[5, 4, 4, 6, 2]) (2) ("(4, 2)") (by aesop))
#guard ¬(onlineMax_postcond (#[5, 4, 4, 6, 2]) (2) ("(5, 2)") (by aesop))
#guard ¬(onlineMax_postcond (#[5, 4, 4, 6, 2]) (2) ("(6, 3)") (by aesop))
#guard onlineMax (#[5, 4, 4, 6, 2]) (2) (by aesop) = ("(5, 3)")

-- Test case 5
#guard onlineMax_precond (#[2, 8, 7, 7, 7]) (3)
#guard onlineMax_postcond (#[2, 8, 7, 7, 7]) (3) ("(8, 4)") (by aesop)
#guard ¬(onlineMax_postcond (#[2, 8, 7, 7, 7]) (3) ("(7, 4)") (by aesop))
#guard ¬(onlineMax_postcond (#[2, 8, 7, 7, 7]) (3) ("(8, 3)") (by aesop))
#guard onlineMax (#[2, 8, 7, 7, 7]) (3) (by aesop) = ("(8, 4)")
