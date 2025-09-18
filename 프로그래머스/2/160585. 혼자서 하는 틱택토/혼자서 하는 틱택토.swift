import Foundation

func solution(_ board:[String]) -> Int {
     let board = board.map { $0.map { String($0) }}
    // 차이는 1 이하여야 한다.
    // 불가 조건 1: X가 O보다 많다.
    let numberOfO = number(of: "O", in: board)
    let numberOfX = number(of: "X", in: board)
    
    
    if numberOfO < numberOfX || (abs(numberOfO - numberOfX) > 1) { 
        return 0 
    } else if numberOfO == numberOfX {
        // 불가 조건 2: 갯수가 같은 경우 O가 이미 끝냈을 수도 있다.
        if numberOfO >= 3 {
            if isGameEnd(by: "O", in: board)  {
                return 0 
            }
        } 
    } else { // O가 X보다 1개 많은 경우
        // 불가 조건 3: X가 게임을 끝냈는데도 진행했을 수 있다.
        if numberOfX >= 3 {
            if isGameEnd(by: "X", in: board) {
                return 0
            }
        }
        
    }
    
    return 1
}

func number(of str: String, in board: [[String]]) -> Int {
    var numOfStr = 0
    
    for row in 0..<board.count {
        for col in 0..<board[0].count {
            if board[row][col] == str { 
                numOfStr += 1
            }
        }
    }
    
    return numOfStr
}

func isGameEnd(by str: String, in board: [[String]]) -> Bool {
    
    func test(_ pos: [Int], directions: [Direction]) -> Bool {
        let str = board[pos[0]][pos[1]]
        
        for dir in directions {
            var length = 1 
            
            let searchPositions = getPos(from: pos, direction: dir)
            
            for searchPosition in searchPositions {
                if board[searchPosition[0]][searchPosition[1]] == str {
                    length += 1
                }
            }
                            
            if length == 3 { return true }
        }
        
        return false
    }
    
    for row in 0..<board.count {
        for col in 0..<board[0].count {
            if board[row][col] == str {
                let pos = [row, col]
                switch (row, col) {
                    case (0, 0):
                    if test(pos, directions: [.right, .down, .rightDown]) { return true }
                    case (0, 1):
                    if  test(pos, directions: [.leftRight, .down]) { return true }
                    case (0, 2):
                    if test(pos, directions: [.left, .down, .leftDown]) { return true }
                    case (1, 0):
                    if test(pos, directions: [.right, .upDown]) { return true }
                    case (1, 1):
                    if test(pos, directions: [.upDown, .leftRight, .leftUpRightDown, .leftDownRightUp]) { return true }
                    case (1, 2):
                    if test(pos, directions: [.left, .upDown]) { return true }
                    case (2, 0):
                    if test(pos, directions: [.up, .right, .rightUp]) { return true }
                    case (2, 1):
                    if test(pos, directions: [.up, .leftRight]) { return true }
                    case (2, 2):
                    if test(pos, directions: [.left, .up, .leftUp]) { return true }
                    default: 
                    return false
                }
            }
        }
    }
    
    return false
}

enum Direction {
    case up, down, left, right, upDown, leftRight, leftUp, leftDown, rightUp, rightDown, leftUpRightDown, leftDownRightUp
}

func getPos(from pos: [Int], direction: Direction) -> [[Int]] {
    let row = pos[0]
    let col = pos[1]
    
    switch direction {
        case .up: return [[row - 1, col], [row - 2, col]]
        case .down: return [[row + 1, col], [row + 2, col]]
        case .left: return [[row, col - 1], [row, col - 2]]
        case .right: return [[row, col + 1], [row, col + 2]]
        case .upDown: return [[row - 1, col], [row + 1, col]]
        case .leftRight: return [[row, col - 1], [row, col + 1]]
        case .leftUp: return [[row - 1, col - 1], [row - 2, col - 2]]
        case .leftDown: return [[row + 1, col - 1], [row + 2, col - 2]]
        case .rightUp: return [[row - 1, col + 1], [row - 2, col + 2]]
        case .rightDown: return [[row + 1, col + 1], [row + 2, col + 2]]
        case .leftUpRightDown: return [[row - 1, col - 1], [row + 1, col + 1]]
        case .leftDownRightUp: return [[row + 1, col - 1], [row - 1, col + 1]]
    }
}