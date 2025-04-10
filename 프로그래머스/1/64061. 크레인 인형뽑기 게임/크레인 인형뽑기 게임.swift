import Foundation

func solution(_ board:[[Int]], _ moves:[Int]) -> Int {
    var newBoard: [[Int]] = Array(repeating: [], count: board.count)
    var basket: [Int] = []
    var result = 0
    
    for length in 0..<board[0].count {
        for depth in stride(from: board.count-1, through: 0, by: -1) {
            let item = board[depth][length]
            if item != 0 {
                newBoard[length].append(item)
            }
        }
    }
    
    for line in moves {
        guard let exportedItem = newBoard[line-1].popLast() else { continue }
        
        if let lastItemInBasket = basket.last {
            if lastItemInBasket == exportedItem {
                _ = basket.popLast()!
                result += 2
            } else {
                basket.append(exportedItem)
            }
        } else {
            basket.append(exportedItem)
        }
        
    }
    
    return result
}