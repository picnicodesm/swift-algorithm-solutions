import Foundation

func solution(_ n:Int, _ control:String) -> Int {
    var result = n
    var command: [Character: Int] = ["w": 1, "s": -1, "d": 10, "a": -10]
    
    for c in control {
        result += command[c]!
    }
    
    return result
}