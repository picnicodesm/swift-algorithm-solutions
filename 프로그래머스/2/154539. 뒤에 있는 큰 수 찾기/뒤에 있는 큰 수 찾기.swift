import Foundation

func solution(_ numbers:[Int]) -> [Int] {
    
    var result: [Int] = Array(repeating: -1, count: numbers.count)
    var stack: [(Int, Int)] = []
    
    for (i, num) in numbers.enumerated() {
        if stack.isEmpty { 
            stack.append((i, num))
            continue
        }
        
        while !stack.isEmpty && stack.last!.1 < num {
            let info = stack.removeLast()
            result[info.0] = num
        }
        
        stack.append((i, num))
    }
    
    return result
}