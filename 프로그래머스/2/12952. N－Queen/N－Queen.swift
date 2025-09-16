import Foundation

func solution(_ n:Int) -> Int {
    var rowState = Array(repeating: false, count: n)
    var colState = Array(repeating: false, count: n)
    var leftDownDiagonalState = Array(repeating: false, count: 2 * n - 1)
    var rightDownDiagonalState = Array(repeating: false, count: 2 * n - 1)
    var result = 0
    
    func dfs(_ pos: [Int]) {
        let leftDownDiagonalIndex = pos[0] + pos[1]
        let rightDownDiagonalIndex = pos[0] - pos[1] + n - 1
        
        if colState[pos[1]] ||
        leftDownDiagonalState[leftDownDiagonalIndex] || rightDownDiagonalState[rightDownDiagonalIndex] {
            return
        }
        
        if pos[0] == n - 1 {
            result += 1
            return
        }
        
        rowState[pos[0]] = true
        colState[pos[1]] = true
        leftDownDiagonalState[leftDownDiagonalIndex] = true
        rightDownDiagonalState[rightDownDiagonalIndex] = true
    
        
        for col in 0..<n {
            dfs([pos[0] + 1, col])
        }
        
        rowState[pos[0]] = false
        colState[pos[1]] = false
        leftDownDiagonalState[leftDownDiagonalIndex] = false
        rightDownDiagonalState[rightDownDiagonalIndex] = false
        
    }
    
    for col in 0..<n {
        dfs([0, col])
    }
    
    return result
}