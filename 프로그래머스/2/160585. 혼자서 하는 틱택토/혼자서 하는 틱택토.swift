import Foundation

typealias Pos = (row: Int, col: Int)

func solution(_ board:[String]) -> Int {

    let (countO, countX, newBoard) = convert(board)
    
    if abs(countO - countX) > 1 { return 0 }
    
    if countO < countX {
        return 0
    } else if countO == countX {
        if isWin("O", board: newBoard) { return 0 }
    } else {
        if isWin("X", board: newBoard) { return 0 }
    }
    
    return 1
}

func isWin(_ char: String, board: [[String]]) -> Bool {
    // --------------------------- 내부 함수 -------------------------------
    // 양옆
    func successOfSide(_ pos: Pos) -> Bool {
        var leftCol = pos.col
        var rightCol = pos.col

        while leftCol >= 0 {
            if board[pos.row][leftCol] != char { return false }
            leftCol -= 1
        }
        
        while rightCol < board[0].count {
            if board[pos.row][rightCol] != char { return false }
            rightCol += 1
        }
        
        return true
    }
    
    // 위아래
    func successOfUpDown(_ pos: Pos) -> Bool {
        var upRow = pos.row
        var downRow = pos.row

        while upRow >= 0 {
            if board[upRow][pos.col] != char { return false }
                upRow -= 1
        }
            
        while downRow < board.count {
            if board[downRow][pos.col] != char { return false }
                downRow += 1
        }
        
        return true
    }
    
    // 대각선
    func successOfDiagonal(_ pos: Pos) -> Bool {
        var leftUpPos: Pos = (pos.row - 1, pos.col - 1)
        var leftDownPos: Pos = (pos.row + 1, pos.col - 1)
        var rightUpPos: Pos = (pos.row - 1, pos.col + 1)
        var rightDownPos: Pos = (pos.row + 1, pos.col + 1)
        
        var leftUpCondition: Bool { (leftUpPos.row >= 0 && leftUpPos.col >= 0) }
        var leftDownCondition: Bool { (leftDownPos.row < board.count && leftDownPos.col >= 0) }
        var rightUpCondition: Bool { (rightUpPos.row >= 0 && rightUpPos.col < board[0].count) }
        var rightDownCondition: Bool { (rightDownPos.row < board.count && rightDownPos.col < board[0].count) }
        var count = 0
        
        // \ 방향
        while leftUpCondition {
            if board[leftUpPos.row][leftUpPos.col] != char {
                return false
            } else if board[leftUpPos.row][leftUpPos.col] == char { count += 1 }
            leftUpPos = (leftUpPos.row - 1, leftUpPos.col - 1)
        }
            
        while rightDownCondition {
            if board[rightDownPos.row][rightDownPos.col] != char {
                return false
            } else if board[rightDownPos.row][rightDownPos.col] == char { count += 1 }
            rightDownPos = (rightDownPos.row + 1, rightDownPos.col + 1)
        }   
        
        if count == (board.count - 1) { return true }
        
        // / 방향
        count = 0
        while leftDownCondition {
            if board[leftDownPos.row][leftDownPos.col] != char {
                return false
            } else if board[leftDownPos.row][leftDownPos.col] == char { count += 1 }
            leftDownPos = (leftDownPos.row + 1, leftDownPos.col - 1)
        }
            
        while rightUpCondition {
            if board[rightUpPos.row][rightUpPos.col] != char {
                return false
            } else if board[rightUpPos.row][rightUpPos.col] == char { count += 1 }
            rightUpPos = (rightUpPos.row - 1, rightUpPos.col + 1)
        }   
        
        return count == (board.count - 1)
    }
    
    // --------------------------- 사용 -------------------------------
    for row in 0..<board.count {
        for col in 0..<board[0].count {
            if board[row][col] == char {
                let pos = (row, col)
                if successOfSide(pos) || successOfUpDown(pos) || successOfDiagonal(pos) {
                    return true
                }
            }
        }
    }
    
    return false
}

func convert(_ board: [String]) -> (Int, Int, [[String]]) {
    var countO = 0
    var countX = 0
    var newBoard: [[String]] = []
        
    board.forEach {
        var newLine: [String] = []
        $0.forEach {
            let char = String($0)
            if char == "O" { countO += 1 }
            else if char == "X" { countX += 1 }
            newLine.append(char)
        }
        newBoard.append(newLine)
    }
    
    return (countO, countX, newBoard)
}