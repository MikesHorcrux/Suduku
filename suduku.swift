import Foundation

func sudoku2(_ grid: [[Character]]) -> Bool {
    
    //set the arrays with repeating 9 times set literal
    //using a set because items need to be unique
    var rowArray = Array(repeating: Set<Character>(), count: 9)
    var colArray = Array(repeating: Set<Character>(), count: 9)
    var blockArray = Array(repeating: Set<Character>(), count: 9)

    for (itemInRow, row) in grid.enumerated() {
        //dont insert "."
        for (itemInCol, char) in row.enumerated() where char != "." {
            //create sudku blocks
            let block = (itemInRow / 3) + 3 * (itemInCol / 3)
            //check if you can insert charcter from the puzzle in the proper array both (row and col). if your unable to that means That char is contained inthe array already, puzzle invalid return false .check if block is able to insert char in block array if not return false
            if !rowArray[itemInRow].insert(char).inserted || !colArray[itemInCol].insert(char).inserted ||  !blockArray[block].insert(char).inserted{
                return false
            }
        }
    }
    return true
}

sudoku2([[".",".",".","1","4",".",".","2","."],
[".",".","6",".",".",".",".",".","."],
[".",".",".",".",".",".",".",".","."],
[".",".","1",".",".",".",".",".","."],
[".","6","7",".",".",".",".",".","9"],
[".",".",".",".",".",".","8","1","."],
[".","3",".",".",".",".",".",".","6"],
[".",".",".",".",".","7",".",".","."],
[".",".",".","5",".",".",".","7","."]])
//true

sudoku2([[".",".",".","9",".",".",".",".","."],
[".",".",".",".",".",".",".",".","."],
[".",".","3",".",".",".",".",".","1"],
[".",".",".",".",".",".",".",".","."],
["1",".",".",".",".",".","3",".","."],
[".",".",".",".","2",".","6",".","."],
[".","9",".",".",".",".",".","7","."],
[".",".",".",".",".",".",".",".","."],
["8",".",".","8",".",".",".",".","."]])
//false

sudoku2([[".",".",".",".",".",".","5",".","."],
[".",".",".",".",".",".",".",".","."],
[".",".",".",".",".",".",".",".","."],
["9","3",".",".","2",".","4",".","."],
[".",".","7",".",".",".","3",".","."],
[".",".",".",".",".",".",".",".","."],
[".",".",".","3","4",".",".",".","."],
[".",".",".",".",".","3",".",".","."],
[".",".",".",".",".","5","2",".","."]])
//false
