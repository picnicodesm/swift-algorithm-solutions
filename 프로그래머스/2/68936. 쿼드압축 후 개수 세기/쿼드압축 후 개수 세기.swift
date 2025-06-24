import Foundation

func solution(_ arr:[[Int]]) -> [Int] {
    
    func compress(pos: (row: Int, col: Int), size: Int, matrix: inout [[Int]], result: inout [Int]) {
        if size == 1 { 
            result[matrix[pos.row][pos.col]] += 1
            return
        }
        
        let pivot = matrix[pos.row][pos.col]
        var flag = false
        
        for row in pos.row..<pos.row+size {
            for col in pos.col..<pos.col+size {
                if matrix[row][col] != pivot {
                    flag = true
                    break
                }
            }
        }
        
        if flag {
            compress(pos: pos, size: size / 2, matrix: &matrix, result: &result) 
            compress(pos: (pos.row, (pos.col + pos.col+size)/2), size: size / 2, matrix: &matrix, result: &result) 
            compress(pos: ((pos.row + pos.row+size)/2, pos.col), size: size / 2, matrix: &matrix, result: &result) 
            compress(pos: ((pos.row + pos.row+size)/2, (pos.col + pos.col+size)/2), size: size / 2, matrix: &matrix, result: &result)
        } else {
            result[pivot] += 1
        }
    }
    
    var matrix = arr
    var result = [0, 0]
    compress(pos: (0, 0), size: arr.count, matrix: &matrix, result: &result)
    
    return result
}