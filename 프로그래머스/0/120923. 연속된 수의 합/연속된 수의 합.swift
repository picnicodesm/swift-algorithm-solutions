import Foundation

func solution(_ num:Int, _ total:Int) -> [Int] {
    var result: [Int] = Array(-1000...1000)
    var frontIndex = 1000
    var backIndex = frontIndex + num - 1
    var sum = Array(result[frontIndex...backIndex]).reduce(0,+)
    
    while sum != total {
        if sum < total {
            frontIndex += 1
            backIndex += 1
        } else {
            frontIndex -= 1
            backIndex -= 1
        }
        sum = Array(result[frontIndex...backIndex]).reduce(0, +)
    }
    
    return Array(result[frontIndex...backIndex])
}