import Foundation

func solution(_ arr1:[Int], _ arr2:[Int]) -> Int {
    if arr1.count > arr2.count {
        return 1
    } else if arr1.count < arr2.count {
        return -1
    } else {
        let sum1 = arr1.reduce(0, +)
        let sum2 = arr2.reduce(0, +)
        if sum1 > sum2 {
            return 1
        } else if sum1 < sum2 {
            return -1
        } else {
            return 0
        }
    }
}