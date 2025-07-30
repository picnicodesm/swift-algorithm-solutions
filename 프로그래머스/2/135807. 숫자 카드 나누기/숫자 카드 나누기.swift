import Foundation

func solution(_ arrayA:[Int], _ arrayB:[Int]) -> Int {
    var maxDividerA = arrayA.first!
    var maxDividerB = arrayB.first!
    var dividersA: [Int] = []
    var dividersB: [Int] = []
    var result = 0
    
    for i in 1..<arrayA.count {
        maxDividerA = gcd(maxDividerA, arrayA[i])
        maxDividerB = gcd(maxDividerB, arrayB[i])
    }
    
    for i in stride(from: maxDividerA, to: 0, by: -1) {
        var flag = true 
        
        for n in arrayA {
            if n % i != 0 {
                flag = false
                break
            }
        }
        
        if flag { dividersA.append(i) }
    }
    
    for i in stride(from: maxDividerB, to: 0, by: -1) {
        var flag = true 
        
        for n in arrayB {
            if n % i != 0 {
                flag = false
                break
            }
        }
        
        if flag { dividersB.append(i) }
    }
    
    for divider in dividersA {
        var flag = true 
        
        for n in arrayB {
            if n % divider == 0 {
                flag = false
                break
            }
        }
        
        if flag { 
            result = max(result, divider)
            break
        }
    }
    
    for divider in dividersB {
        var flag = true 
        
        for n in arrayA {
            if n % divider == 0 {
                flag = false
                break
            }
        }
        
        if flag { 
            result = max(result, divider)
            break
        }
    }
    
    return result
}

func gcd(_ a: Int, _ b: Int) -> Int {
    if b == 0 { return a }
    
    return gcd(b, a%b)
}