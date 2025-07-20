import Foundation

func solution(_ arr:[Int]) -> [Int] {
    var limit = 1
    var result = arr
    
    while limit < arr.count {
        limit *= 2
    }
    
    result += Array(repeating: 0, count: limit-arr.count)
    
    return result
}