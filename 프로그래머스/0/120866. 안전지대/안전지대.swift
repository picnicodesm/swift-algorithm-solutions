import Foundation

func solution(_ board:[[Int]]) -> Int {
    var safeMap: [[Bool]] = Array(repeating: Array(repeating: true, count: board.count), count: board.count)
    var around: [(Int, Int)] = [(-1, -1), (-1, 0), (-1, 1), (0, -1), (0, 1), (1, -1), (1, 0), (1, 1)]
    var result = 0
    
    func inBoard(_ pos: (Int, Int)) -> Bool {
        return pos.0 >= 0 && pos.0 < board.count && pos.1 >= 0 && pos.1 < board.count
    }
    
    for row in 0..<board.count {
        for col in 0..<board.count {
            if board[row][col] == 1 {
                safeMap[row][col] = false
                for pos in around {
                    let aroundIndex = (row + pos.0, col + pos.1)
                    if inBoard(aroundIndex) {
                        safeMap[aroundIndex.0][aroundIndex.1] = false
                    }
                }
            }
        }
    }
    
    for line in safeMap {
        for block in line {
            if block == true { result += 1 }
        }
    }
    
    return result
}

