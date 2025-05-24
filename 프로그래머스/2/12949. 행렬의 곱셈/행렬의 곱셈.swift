import Foundation

func solution(_ arr1:[[Int]], _ arr2:[[Int]]) -> [[Int]] {
    var result: [[Int]] = Array(repeating: Array(repeating: 0, count: arr2[0].count), count: arr1.count)
    
    for row in 0..<arr1.count {
        for col in 0..<arr2[0].count {
            for k in 0..<arr1[0].count {
                result[row][col] += arr1[row][k] * arr2[k][col]
            }
        }
    }
    
    return result
}