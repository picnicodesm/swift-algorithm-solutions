import Foundation

func solution(_ board:[String]) -> Int {
    var board = board.map { Array($0).map { String($0) } }
    var memo = ["O": 0, "X": 0, ".": 0]
    var isXWin = false
    var isOWin = false
    
    // 대각선으로 이긴 경우 체크
    if board[0][0] == board[1][1] && board[1][1] == board[2][2] {
        if board[0][0] == "X" {
            isXWin = true
        } else if board[0][0] == "O"{
            isOWin = true
        }
    } else if board[0][2] == board[1][1] && board[1][1] == board[2][0] {
        if board[0][2] == "X" {
            isXWin = true
        } else if board[0][2] == "O" {
            isOWin = true
        }
    }
    
    for i in 0..<board.count {
        // 가로로 이긴 경우
        if board[i][0] == board[i][1] && board[i][1] == board[i][2] {
            if board[i][0] == "X" {
                isXWin = true
            } else if board[i][0] == "O"{
                isOWin = true
            }
        }
        // 세로로 이긴 경우
        if board[0][i] == board[1][i] && board[1][i] == board[2][i] {
            if board[0][i] == "X" {
                isXWin = true
            } else if board[0][i] == "O"{
                isOWin = true
            }
        }
        
        for j in 0..<board[i].count {
            memo[board[i][j]]! += 1
        }
    }
    
    // 둘 다 이긴 경우 불가
    if isXWin == isOWin && isXWin {
        return 0
    }
    
    // X가 이겼는데 O의 갯수가 X 갯수보다 더 많은 경우
    if isXWin && memo["O"]! > memo["X"]! {
        return 0
    }
    
    // O가 이겼는데 X의 갯수가 O와 같거나 많은 경우
    if isOWin && memo["O"]! <= memo["X"]! {
        return 0
    }
    
    // O차례에 X를 놓은 경우
    if memo["O"]! < memo["X"]! {
        return 0
    }
    
    // X차례에 O를 놓은 경우
    if memo["O"]! > memo["X"]! + 1 {
        return 0
    }
    
    return 1
}