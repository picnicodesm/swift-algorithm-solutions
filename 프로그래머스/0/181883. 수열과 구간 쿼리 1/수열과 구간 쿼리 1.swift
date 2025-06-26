import Foundation

func solution(_ arr:[Int], _ queries:[[Int]]) -> [Int] {
    var arr = arr
    
    for query in queries {
        for i in query[0]...query[1] {
            arr[i] += 1
        }
    }
    
    return arr
}