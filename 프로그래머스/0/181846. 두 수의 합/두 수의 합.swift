import Foundation

func solution(_ a:String, _ b:String) -> String {
    var charA = Array(a)
    var charB = Array(b)
    let a = Array(charA.map { Int(String($0))! }.reversed())
    let b = Array(charB.map { Int(String($0))! }.reversed())
    var result: [Int] = []
    
    var sum = 0
    var upper = 0
    var unit = 0
    
    
    for i in 0..<max(a.count, b.count) {
        if i < a.count && i < b.count {
            sum = a[i] + b[i] + upper
        } else if i < a.count && i >= b.count {
            sum = a[i] + upper
        } else {
            sum = b[i] + upper
        }
        
        unit = sum % 10
        upper = sum / 10
        result.append(unit)
    }
    
    if upper != 0 {
        result.append(upper)
    }
    
    return result.map { String($0) }.reversed().joined()
}