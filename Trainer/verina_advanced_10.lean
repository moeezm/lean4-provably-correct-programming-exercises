import Aesop

/-
-----Description-----  
his task requires writing a Lean 4 method decomposes a natural number `n` into
its prime factorization components based on a user-provided list of primes.
Specifically, it calculates the exponents for each prime in the factorization
such that:
\[ n = \prod p^e \]
In other words, it determines the exponent e for each prime p.

-----Input-----  
The input consists of a natural number n, and a list of prime numbers. The
input n is obtained by multiplying together any powers of the prime numbers from
the provided list.
n: The natural number to be factorized.  
primes: A list of primes to decompose n into.  

-----Output-----  
The output is `List (Nat × Nat)`:
Return a list of pair/Cartesian product of two natural numbers (p, e), where p
is the prime and e is the exponent of p in the factorization. Each prime in the
output must be from the input list, and every prime in the input list must
appear in the output.


-/

@[reducible, simp]
def findExponents_precond (n : Nat) (primes : List Nat) : Prop := sorry

def findExponents (n : Nat) (primes : List Nat) (h_precond : findExponents_precond n primes) : List (Nat × Nat) := sorry

@[reducible, simp]
def findExponents_postcond (n : Nat) (primes : List Nat) (result : List (Nat × Nat)) (h_precond : findExponents_precond n primes) : Prop := sorry

theorem findExponents_spec_satisfied (n : Nat) (primes : List Nat) (h_precond : findExponents_precond n primes) :
    findExponents_postcond n primes (findExponents n primes h_precond) h_precond := by
  sorry

-- Test Guards

-- Rejected inputs
#guard ¬(findExponents_precond (6) ([6]))

-- Test case 1
#guard findExponents_precond (6) ([2, 3])
#guard findExponents_postcond (6) ([2, 3]) ([(2, 1), (3, 1)]) (by aesop)
#guard ¬(findExponents_postcond (6) ([2, 3]) ([(1, 2), (2, 3)]) (by aesop))
#guard ¬(findExponents_postcond (6) ([2, 3]) ([(2, 1), (3, 2)]) (by aesop))
#guard findExponents (6) ([2, 3]) (by aesop) = ([(2, 1), (3, 1)])

-- Test case 2
#guard findExponents_precond (6285195213566005335561053533150026217291776) ([2, 3, 5])
#guard findExponents_postcond (6285195213566005335561053533150026217291776) ([2, 3, 5]) ([(2, 55), (3, 55), (5, 0)]) (by aesop)
#guard ¬(findExponents_postcond (6285195213566005335561053533150026217291776) ([2, 3, 5]) ([(2, 2), (3, 55), (5, 59)]) (by aesop))
#guard ¬(findExponents_postcond (6285195213566005335561053533150026217291776) ([2, 3, 5]) ([(2, 55), (3, 55), (7, 0)]) (by aesop))
#guard findExponents (6285195213566005335561053533150026217291776) ([2, 3, 5]) (by aesop) = ([(2, 55), (3, 55), (5, 0)])

-- Test case 3
#guard findExponents_precond (360) ([2, 3, 5])
#guard findExponents_postcond (360) ([2, 3, 5]) ([(2, 3), (3, 2), (5, 1)]) (by aesop)
#guard ¬(findExponents_postcond (360) ([2, 3, 5]) ([(2, 3), (3, 2), (5, 0)]) (by aesop))
#guard ¬(findExponents_postcond (360) ([2, 3, 5]) ([(2, 3), (3, 2), (7, 5)]) (by aesop))
#guard findExponents (360) ([2, 3, 5]) (by aesop) = ([(2, 3), (3, 2), (5, 1)])

-- Test case 4
#guard findExponents_precond (18903812908) ([2, 43, 823, 133543])
#guard findExponents_postcond (18903812908) ([2, 43, 823, 133543]) ([(2, 2), (43, 1), (823, 1), (133543, 1)]) (by aesop)
#guard ¬(findExponents_postcond (18903812908) ([2, 43, 823, 133543]) ([(2, 2), (43, 4), (823, 0), (133543, 1)]) (by aesop))
#guard ¬(findExponents_postcond (18903812908) ([2, 43, 823, 133543]) ([(2, 2), (43, 1), (823, 2)]) (by aesop))
#guard findExponents (18903812908) ([2, 43, 823, 133543]) (by aesop) = ([(2, 2), (43, 1), (823, 1), (133543, 1)])

-- Test case 5
#guard findExponents_precond (114514) ([2, 31, 1847])
#guard findExponents_postcond (114514) ([2, 31, 1847]) ([(2, 1), (31, 1), (1847, 1)]) (by aesop)
#guard ¬(findExponents_postcond (114514) ([2, 31, 1847]) ([(2, 1), (31, 1), (1847, 0)]) (by aesop))
#guard ¬(findExponents_postcond (114514) ([2, 31, 1847]) ([(2, 1), (33, 1), (1847, 1)]) (by aesop))
#guard findExponents (114514) ([2, 31, 1847]) (by aesop) = ([(2, 1), (31, 1), (1847, 1)])

-- Test case 6
#guard findExponents_precond (20241147794175) ([3, 5, 7, 11, 31, 47])
#guard findExponents_postcond (20241147794175) ([3, 5, 7, 11, 31, 47]) ([(3, 3), (5, 2), (7, 1), (11, 3), (31, 1), (47, 3)]) (by aesop)
#guard ¬(findExponents_postcond (20241147794175) ([3, 5, 7, 11, 31, 47]) ([(0, 77), (17, 7)]) (by aesop))
#guard ¬(findExponents_postcond (20241147794175) ([3, 5, 7, 11, 31, 47]) ([(3, 3), (5, 2), (7, 1), (11, 3), (31, 1), (33, 2)]) (by aesop))
#guard findExponents (20241147794175) ([3, 5, 7, 11, 31, 47]) (by aesop) = ([(3, 3), (5, 2), (7, 1), (11, 3), (31, 1), (47, 3)])
