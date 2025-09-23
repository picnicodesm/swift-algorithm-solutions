import Foundation

func solution(_ arr:[Int], _ k:Int) -> [Int] {
    var result: [Int] = []
    
    for n in arr {
        if !result.contains(n) {
            result.append(n)
        }
        
        if result.count == k { return result }
    }
    
    if result.count < k {
        result.append(contentsOf: Array(repeating: -1, count: k - result.count))
    }
    
    return result
}