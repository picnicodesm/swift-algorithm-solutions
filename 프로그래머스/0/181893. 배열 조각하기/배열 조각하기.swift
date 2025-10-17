import Foundation

func solution(_ arr:[Int], _ query:[Int]) -> [Int] {
    
    var arr = arr
    
    for i in 0..<query.count {
        if i % 2 == 0 {
            arr = Array(arr[0...query[i]])
        } else {
            let index = query[i]
            arr = Array(arr[index...])
        }
    }
    
    return arr
}