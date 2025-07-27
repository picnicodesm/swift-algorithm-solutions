import Foundation

func solution(_ n:Int) -> Int {
    var mul = 1
    var i = 1
    
    while true {
        mul *= i
        
        if mul > n { return i - 1 }
        
        i += 1
    }
}