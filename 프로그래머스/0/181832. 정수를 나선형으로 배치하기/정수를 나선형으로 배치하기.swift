import Foundation

func solution(_ n:Int) -> [[Int]] {
    var arr: [[Int]] = Array(repeating: Array(repeating: 0, count: n), count: n)
    var idx: (row: Int, col: Int) = (0, 0)
    let dir = [(0, 1), (1, 0), (0, -1), (-1, 0)] // right, down, left, up
    var dirIdx = 0 // right
    
    func changeDir() {
        dirIdx = (dirIdx + 1) % 4
    }
    
    func isValidIdx(_ idx: (Int, Int)) -> Bool {
        if idx.0 >= 0 && idx.0 < n && idx.1 >= 0 && idx.1 < n {
            if arr[idx.0][idx.1] == 0 { return true }
            else { return false }
        } else {
            return false
        }
    }
    
    for i in 0..<n {
        for j in 1...n {
            let n = i * n + j
            arr[idx.row][idx.col] = n
            let nextIdx = (idx.row + dir[dirIdx].0, idx.col + dir[dirIdx].1)
            
            if isValidIdx(nextIdx) {
                idx = nextIdx
            } else {
                changeDir()
                idx = (idx.row + dir[dirIdx].0, idx.col + dir[dirIdx].1)
            }
        }
    }
    
    return arr
}