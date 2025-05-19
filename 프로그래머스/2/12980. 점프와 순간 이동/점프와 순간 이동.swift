import Foundation

func solution(_ n:Int) -> Int {
    var ans:Int = 0
    var remain = n
    
    while remain != 0 {
        if remain % 2 == 1 { 
            remain -= 1
            ans += 1
        } else { remain /= 2}
    }

    return ans
}