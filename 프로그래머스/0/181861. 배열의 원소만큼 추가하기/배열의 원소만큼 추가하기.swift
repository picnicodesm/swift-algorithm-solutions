import Foundation

func solution(_ arr:[Int]) -> [Int] {
    var result: [Int] = []
    
    for n in arr {
        result += Array(repeating: n, count: n)
    }
    
    return result
}