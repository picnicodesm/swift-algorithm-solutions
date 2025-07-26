import Foundation

func solution(_ emergency:[Int]) -> [Int] {
    var order = emergency.sorted(by: >)
    var result: [Int] = []
    
    for priority in emergency {
        result.append(order.firstIndex(of: priority)! + 1)
    }
    
    return result
}