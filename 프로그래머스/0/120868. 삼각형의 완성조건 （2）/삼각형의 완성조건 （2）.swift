import Foundation

func solution(_ sides:[Int]) -> Int {
    var long = max(sides[0], sides[1])
    var short = min(sides[0], sides[1])
    var result = 0

    for l in 1..<long {
        if (short + l) > long {
            result += 1
        }
    } 
    
    for _ in long..<(long+short) {
        result += 1
    }
    
    return result
}