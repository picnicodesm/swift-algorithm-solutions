import Foundation

func solution(_ arrayA:[Int], _ arrayB:[Int]) -> Int {
    var maxDivisorA = arrayA.first!
    var maxDivisorB = arrayB.first!
    var divisorsA: [Int] = []
    var divisorsB: [Int] = []
    var result = 0
    
    for i in 1..<arrayA.count {
        maxDivisorA = gcd(maxDivisorA, arrayA[i])
        maxDivisorB = gcd(maxDivisorB, arrayB[i])
    }
    
    for i in stride(from: maxDivisorA, to: 0, by: -1) {
        var flag = true 
        
        for n in arrayA {
            if n % i != 0 {
                flag = false
                break
            }
        }
        
        if flag { divisorsA.append(i) }
    }
    
    for i in stride(from: maxDivisorB, to: 0, by: -1) {
        var flag = true 
        
        for n in arrayB {
            if n % i != 0 {
                flag = false
                break
            }
        }
        
        if flag { divisorsB.append(i) }
    }
    
    for divisor in divisorsA {
        var flag = true 
        
        for n in arrayB {
            if n % divisor == 0 {
                flag = false
                break
            }
        }
        
        if flag { 
            result = max(result, divisor)
            break
        }
    }
    
    for divisor in divisorsB {
        var flag = true 
        
        for n in arrayA {
            if n % divisor == 0 {
                flag = false
                break
            }
        }
        
        if flag { 
            result = max(result, divisor)
            break
        }
    }
    
    return result
}

func gcd(_ a: Int, _ b: Int) -> Int {
    if b == 0 { return a }
    
    return gcd(b, a%b)
}