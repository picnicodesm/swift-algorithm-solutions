import Foundation

func solution(_ absolutes:[Int], _ signs:[Bool]) -> Int {
    let nums = absolutes.enumerated().map {
        return signs[$0.offset] ? $0.element : -$0.element
    }
    
    return nums.reduce(0, +)
}