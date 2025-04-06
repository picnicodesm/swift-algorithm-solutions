import Foundation

func solution(_ arr:[Int], _ n:Int) -> [Int] {
    var result = arr
    var start = arr.count % 2 == 0 ? 1 : 0
    
    for i in stride(from: start, to: arr.count, by: 2) {
        result[i] += n
    }
    
    return result
}