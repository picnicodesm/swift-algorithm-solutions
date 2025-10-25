import Foundation

func solution(_ numer1:Int, _ denom1:Int, _ numer2:Int, _ denom2:Int) -> [Int] {
    var numer =  numer1 * denom2 + numer2 * denom1
    var denom = denom1 * denom2
    var i = 2
    
    while i <= numer {
        if numer % i == 0 && denom % i == 0 {
            numer /= i
            denom /= i
        } else {
            i += 1
        }
    }
    
    return [numer, denom]
}