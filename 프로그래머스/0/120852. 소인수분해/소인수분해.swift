import Foundation

func solution(_ n:Int) -> [Int] {
    var n = n 
    var result: Set<Int> = []
    var div = 2
    
    while n != 1 {
        if n % div == 0 {
            n /= div
            result.insert(div)
        } else {
            div += 1
        }
    }
    
    return result.sorted()
}