import Foundation

func solution(_ numbers:[Int]) -> String {
    var numbers = numbers.map { String($0) }
        
    numbers.sort(by: { return $0+$1 > $1+$0 })
        
    return numbers[0] == "0" ? "0" : numbers.joined()
}