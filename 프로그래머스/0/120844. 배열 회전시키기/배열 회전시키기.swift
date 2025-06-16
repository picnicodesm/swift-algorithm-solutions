import Foundation

func solution(_ numbers:[Int], _ direction:String) -> [Int] {
    if direction == "left" {
        return numbers[1...] + [Int](arrayLiteral: numbers[0])
    } else {
        return [Int](arrayLiteral: numbers.last!) + numbers[0..<numbers.count-1]
    }
}