import Foundation

func solution(_ num_list:[Int]) -> Int {
    var result  = 0
    
    for n in num_list {
        var n = n
        while n != 1 {
            if n % 2 == 0 { n /= 2 }
            else { n = (n-1) / 2 }
            result += 1
        }
    }
    
    return result
}