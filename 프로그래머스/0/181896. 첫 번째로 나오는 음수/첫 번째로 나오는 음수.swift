import Foundation

func solution(_ num_list:[Int]) -> Int {
    for (i, n) in num_list.enumerated() {
        if n < 0 {
            return i
        }
    }
    
    return -1
}