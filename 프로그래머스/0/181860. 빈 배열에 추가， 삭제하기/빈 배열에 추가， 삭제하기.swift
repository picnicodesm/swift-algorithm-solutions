import Foundation

func solution(_ arr:[Int], _ flags:[Bool]) -> [Int] {
    var result: [Int] = [] 
    
    for (n, flag) in zip(arr, flags) {
        if flag { result += Array(repeating: n, count: n * 2) }
        else { 
            for _ in 0..<n {
                result.removeLast()
            }
         }
    }
    
    return result
}