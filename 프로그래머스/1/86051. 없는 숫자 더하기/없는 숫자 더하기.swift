import Foundation

func solution(_ numbers:[Int]) -> Int {
    var set: Set<Int> = [0, 1, 2, 3, 4, 5, 6, 7, 8, 9]
    let _ = numbers.map { set.remove($0) }
    
    return set.reduce(0, +)
}