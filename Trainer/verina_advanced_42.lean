import Aesop

/-
-----Description-----
This task requires writing a Lean 4 function that takes a list of stock prices
and returns the maximum profit achievable by buying on one day and selling on a
later day.

If no profit is possible, the function should return 0.

-----Input-----
The input consists of:
prices: A list of natural numbers representing stock prices on each day.

-----Output-----
The output is a natural number:
Returns the maximum profit achievable with one transaction (buy once, sell
once), or 0 if no profitable transaction is possible.


-/

@[reducible, simp]
def maxProfit_precond (prices : List Nat) : Prop := sorry

def maxProfit (prices : List Nat) (h_precond : maxProfit_precond prices) : Nat := sorry

@[reducible, simp]
def maxProfit_postcond (prices : List Nat) (result : Nat) (h_precond : maxProfit_precond prices) : Prop := sorry

theorem maxProfit_spec_satisfied (prices : List Nat) (h_precond : maxProfit_precond prices) :
    maxProfit_postcond prices (maxProfit prices h_precond) h_precond := by
  sorry

-- Test Guards

-- Test case 1
#guard maxProfit_precond ([7, 1, 5, 3, 6, 4])
#guard maxProfit_postcond ([7, 1, 5, 3, 6, 4]) (5) (by aesop)
#guard ¬(maxProfit_postcond ([7, 1, 5, 3, 6, 4]) (4) (by aesop))
#guard ¬(maxProfit_postcond ([7, 1, 5, 3, 6, 4]) (6) (by aesop))
#guard maxProfit ([7, 1, 5, 3, 6, 4]) (by aesop) = (5)

-- Test case 2
#guard maxProfit_precond ([7, 6, 4, 3, 1])
#guard maxProfit_postcond ([7, 6, 4, 3, 1]) (0) (by aesop)
#guard ¬(maxProfit_postcond ([7, 6, 4, 3, 1]) (1) (by aesop))
#guard ¬(maxProfit_postcond ([7, 6, 4, 3, 1]) (2) (by aesop))
#guard maxProfit ([7, 6, 4, 3, 1]) (by aesop) = (0)

-- Test case 3
#guard maxProfit_precond ([2, 4, 1])
#guard maxProfit_postcond ([2, 4, 1]) (2) (by aesop)
#guard ¬(maxProfit_postcond ([2, 4, 1]) (1) (by aesop))
#guard maxProfit ([2, 4, 1]) (by aesop) = (2)

-- Test case 4
#guard maxProfit_precond ([1, 2])
#guard maxProfit_postcond ([1, 2]) (1) (by aesop)
#guard ¬(maxProfit_postcond ([1, 2]) (0) (by aesop))
#guard maxProfit ([1, 2]) (by aesop) = (1)

-- Test case 5
#guard maxProfit_precond ([])
#guard maxProfit_postcond ([]) (0) (by aesop)
#guard ¬(maxProfit_postcond ([]) (1) (by aesop))
#guard maxProfit ([]) (by aesop) = (0)
