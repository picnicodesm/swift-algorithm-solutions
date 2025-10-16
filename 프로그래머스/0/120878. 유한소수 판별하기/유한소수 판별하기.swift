import Foundation

func solution(_ a:Int, _ b:Int) -> Int {
    
    var i = 2
    var a = a
    var b = b
    var primeSet: Set<Int> = []
    
    while i <= min(a, b) {
        if a % i == 0 && b % i == 0 {
            a /= i
            b /= i
        } else {
            i += 1
        }
    }
    
    i = 2
    while i <= b {
        if b % i == 0 {
            primeSet.insert(i)
            b /= i
        } else {
            i += 1
        }
    }
    
    let satisfy = primeSet.allSatisfy { $0 == 2 || $0 == 5 }
    
    return satisfy ? 1 : 2
}

