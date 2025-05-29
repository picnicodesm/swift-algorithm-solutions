import Foundation

func solution(_ topping:[Int]) -> Int {

    var left: [Int: Int] = [:]
    var right: [Int: Int] = [:]
    var result = 0
    
    left[topping[0]] = 1
    for i in 1..<topping.count { right[topping[i], default: 0] += 1 }
    if left.count == right.count { result += 1 }
    
    for i in 1..<topping.count-1 {
        left[topping[i], default: 0] += 1
        right[topping[i]] = right[topping[i]]! - 1 == 0 ? nil : right[topping[i]]! - 1
        
        if left.count == right.count { result += 1 }
    }
    
    return result
}