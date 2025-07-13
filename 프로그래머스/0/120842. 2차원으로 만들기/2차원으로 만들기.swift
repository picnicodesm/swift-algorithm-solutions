import Foundation

func solution(_ num_list:[Int], _ n:Int) -> [[Int]] {
    var result: [[Int]] = []
    
    for i in stride(from: 0, to: num_list.count, by: n) {
        var arr: [Int] = []
        for j in 0..<n {
            arr.append(num_list[i+j])
        }
        
        result.append(arr)
    }
    
    return result
}