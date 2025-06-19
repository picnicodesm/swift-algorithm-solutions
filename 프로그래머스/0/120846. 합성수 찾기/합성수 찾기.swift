import Foundation

func solution(_ n:Int) -> Int {
    var result = 0
    
    for i in 1...n {
        if isValid(i) { result += 1}
    }

    return result
}

func isValid(_ n: Int) -> Bool {
    var numberOfDivisor = 2
    
    if n < 3 { return false }
    
    for i in 2..<Int(Double(n))+1 {
        if n % i == 0 { 
            numberOfDivisor += 1
            if numberOfDivisor > 3 { return true }
        }
    }
    
    return false
}