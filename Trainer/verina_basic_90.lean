import Aesop

/-
-----Description-----  
The task is to search for a specific integer in a 2D array where the rows and
columns are sorted in non-decreasing order. The goal is to locate the key and
return its position as row and column indices, or return (-1, -1) if the
algorithm fails to find the key.

-----Input-----  
The input consists of:  
• a: A non-empty 2D array of integers (Array (Array Int)). The array is
guaranteed to contain at least one element.
• key: An integer value (Int) to search for in the array.

-----Output-----  
The output is a pair of integers (Int × Int):  
• If the key is found, the first element represents the row index and the
second element represents the column index such that get2d a row col = key.
• If the key is not found, the function returns (-1, -1).

-----Note-----  
It is assumed that the input 2D array is sorted by rows and columns.

-/

@[reducible, simp]
def SlopeSearch_precond (a : Array (Array Int)) (key : Int) : Prop := sorry

def SlopeSearch (a : Array (Array Int)) (key : Int) (h_precond : SlopeSearch_precond a key) : (Int × Int) := sorry

@[reducible, simp]
def SlopeSearch_postcond (a : Array (Array Int)) (key : Int) (result : (Int × Int)) (h_precond : SlopeSearch_precond a key) : Prop := sorry

theorem SlopeSearch_spec_satisfied (a : Array (Array Int)) (key : Int) (h_precond : SlopeSearch_precond a key) :
    SlopeSearch_postcond a key (SlopeSearch a key h_precond) h_precond := by
  sorry

-- Test Guards

-- Rejected inputs
#guard ¬(SlopeSearch_precond (#[#[1, 3, 2], #[0, 6, 5], #[7, 8, 9]]) (2))

-- Test case 1
#guard SlopeSearch_precond (#[#[1, 2, 3], #[4, 5, 6], #[7, 8, 9]]) (5)
#guard SlopeSearch_postcond (#[#[1, 2, 3], #[4, 5, 6], #[7, 8, 9]]) (5) ("(1, 1)") (by aesop)
#guard ¬(SlopeSearch_postcond (#[#[1, 2, 3], #[4, 5, 6], #[7, 8, 9]]) (5) ("(1, 2)") (by aesop))
#guard ¬(SlopeSearch_postcond (#[#[1, 2, 3], #[4, 5, 6], #[7, 8, 9]]) (5) ("(0, 1)") (by aesop))
#guard SlopeSearch (#[#[1, 2, 3], #[4, 5, 6], #[7, 8, 9]]) (5) (by aesop) = ("(1, 1)")

-- Test case 2
#guard SlopeSearch_precond (#[#[1, 2, 3], #[4, 5, 6], #[7, 8, 9]]) (3)
#guard SlopeSearch_postcond (#[#[1, 2, 3], #[4, 5, 6], #[7, 8, 9]]) (3) ("(0, 2)") (by aesop)
#guard ¬(SlopeSearch_postcond (#[#[1, 2, 3], #[4, 5, 6], #[7, 8, 9]]) (3) ("(0, 1)") (by aesop))
#guard ¬(SlopeSearch_postcond (#[#[1, 2, 3], #[4, 5, 6], #[7, 8, 9]]) (3) ("(1, 2)") (by aesop))
#guard SlopeSearch (#[#[1, 2, 3], #[4, 5, 6], #[7, 8, 9]]) (3) (by aesop) = ("(0, 2)")

-- Test case 3
#guard SlopeSearch_precond (#[#[1, 2, 3], #[4, 5, 6], #[7, 8, 9]]) (10)
#guard SlopeSearch_postcond (#[#[1, 2, 3], #[4, 5, 6], #[7, 8, 9]]) (10) ("(-1, -1)") (by aesop)
#guard ¬(SlopeSearch_postcond (#[#[1, 2, 3], #[4, 5, 6], #[7, 8, 9]]) (10) ("(1, 1)") (by aesop))
#guard ¬(SlopeSearch_postcond (#[#[1, 2, 3], #[4, 5, 6], #[7, 8, 9]]) (10) ("(2, 2)") (by aesop))
#guard SlopeSearch (#[#[1, 2, 3], #[4, 5, 6], #[7, 8, 9]]) (10) (by aesop) = ("(-1, -1)")

-- Test case 4
#guard SlopeSearch_precond (#[#[1, 2, 3, 4]]) (4)
#guard SlopeSearch_postcond (#[#[1, 2, 3, 4]]) (4) ("(0, 3)") (by aesop)
#guard ¬(SlopeSearch_postcond (#[#[1, 2, 3, 4]]) (4) ("(0, 2)") (by aesop))
#guard ¬(SlopeSearch_postcond (#[#[1, 2, 3, 4]]) (4) ("(1, 3)") (by aesop))
#guard ¬(SlopeSearch_postcond (#[#[1, 2, 3, 4]]) (4) ("(0, 4)") (by aesop))
#guard SlopeSearch (#[#[1, 2, 3, 4]]) (4) (by aesop) = ("(0, 3)")

-- Test case 5
#guard SlopeSearch_precond (#[#[1], #[2], #[3], #[4]]) (3)
#guard SlopeSearch_postcond (#[#[1], #[2], #[3], #[4]]) (3) ("(2, 0)") (by aesop)
#guard ¬(SlopeSearch_postcond (#[#[1], #[2], #[3], #[4]]) (3) ("(1, 0)") (by aesop))
#guard ¬(SlopeSearch_postcond (#[#[1], #[2], #[3], #[4]]) (3) ("(2, 1)") (by aesop))
#guard SlopeSearch (#[#[1], #[2], #[3], #[4]]) (3) (by aesop) = ("(2, 0)")
