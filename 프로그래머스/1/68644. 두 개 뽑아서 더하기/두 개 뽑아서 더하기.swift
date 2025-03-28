import Foundation

func solution(_ numbers:[Int]) -> [Int] {
    var set: Set<Int> = []
    
    for index1 in 0..<numbers.count-1 {
        for index2 in index1+1..<numbers.count {
            set.insert(numbers[index1] + numbers[index2])
        }
    }
    
    return set.sorted()
}