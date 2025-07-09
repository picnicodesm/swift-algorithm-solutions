import Foundation

func solution(_ arr:[Int], _ queries:[[Int]]) -> [Int] {
    var arr = arr
    
    for query in queries {
        arr.swapAt(query[0], query[1])
    }
    
    return arr
}