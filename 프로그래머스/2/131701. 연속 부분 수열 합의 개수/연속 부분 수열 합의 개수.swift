import Foundation

func solution(_ elements:[Int]) -> Int {
    var sumSet = Set<Int>()
    var circleArr = elements + elements
    var frontIndex = 0
    var backIndex = 1
    
    for windowSize in 1...elements.count {
        frontIndex = 0
        backIndex = frontIndex + windowSize - 1
        var subSum = circleArr[frontIndex...backIndex].reduce(0,+)
        sumSet.insert(subSum)
        
        for i in 0..<elements.count {
            backIndex += 1
            subSum = subSum - circleArr[frontIndex] + circleArr[backIndex]
            frontIndex += 1
            sumSet.insert(subSum)
        }
    }
    
    return sumSet.count
}