import Foundation

func solution(_ n:Int) -> [Int] {
    var num = n
    var result: [Int] = [n]
    
    while num != 1 {
        if num % 2 == 0 { 
            num = num / 2
            result.append(num)
        } else {
            num = 3 * num + 1
            result.append(num)
        }
    }
    
    return result
}