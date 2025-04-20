import Foundation

func solution(_ num_list:[Int]) -> Int {
    var evenSum = 0
    var oddSum = 0
    
    for index in 0..<num_list.count {
        if index % 2 == 0 {
            evenSum += num_list[index]
        } else {
            oddSum += num_list[index]
        }
    }
    
    return max(evenSum, oddSum)
}