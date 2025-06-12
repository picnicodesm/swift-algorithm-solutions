import Foundation

func solution(_ n:Int) -> [[Int]] {
    var result: [[Int]] = []
    
    for i in 0..<n {
        let line = Array(repeating: 0, count: i) + [1] + Array(repeating: 0, count: n-i-1)
        result.append(line)
    }
    
    return result
}