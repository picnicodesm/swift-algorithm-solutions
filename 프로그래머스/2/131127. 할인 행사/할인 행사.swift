import Foundation

func solution(_ want:[String], _ number:[Int], _ discount:[String]) -> Int {
    let windowSize = 10
    var result = 0
    
    for i in 0..<discount.count-windowSize+1 {
        var wants: [String] = []
        for i in 0..<want.count {
            wants += Array(repeating: want[i], count: number[i])
        }
        if wants.sorted() == discount[i..<i+windowSize].sorted() { result += 1}
    }
    
    return result
}