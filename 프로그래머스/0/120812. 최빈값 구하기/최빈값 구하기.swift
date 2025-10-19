import Foundation

func solution(_ array:[Int]) -> Int {
    var result: [Int] = Array(repeating: 0, count: 1001)
    
    for n in array {
        result[n] += 1
    }
    
    let max = result.max()!
    let count = result.filter { $0 == max }

    return count.count != 1 ? -1 : result.firstIndex(of: max)!
}