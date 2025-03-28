import Foundation

func solution(_ n:Int, _ m:Int, _ section:[Int]) -> Int {
    var result = 0    
    var nextIndex = section[0]
    
    for i in section {
        if nextIndex <= i {
            nextIndex = i + m
            result += 1
        }
    }
    
    return result
}