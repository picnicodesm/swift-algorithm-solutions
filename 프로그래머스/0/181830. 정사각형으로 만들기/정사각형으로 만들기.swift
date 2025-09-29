import Foundation

func solution(_ arr:[[Int]]) -> [[Int]] {
    
    var arr = arr
    
    if arr.count > arr[0].count {
        let add = arr.count - arr[0].count
        for i in 0..<arr.count {
            arr[i].append(contentsOf: Array(repeating: 0, count: add))
        }
    } else if arr.count < arr[0].count {
        let add = arr[0].count - arr.count
        for _ in 0..<add {
            arr.append(Array(repeating: 0, count: arr[0].count))
        }
    }
    
    return arr
}