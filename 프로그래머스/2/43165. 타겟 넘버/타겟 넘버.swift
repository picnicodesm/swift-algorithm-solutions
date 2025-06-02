import Foundation

func solution(_ numbers:[Int], _ target:Int) -> Int {
    var result = 0
    var stack: [(Int, Int, Int)] = []
    
    stack.append((numbers[0], 0, 0))
    while !stack.isEmpty {
        let item = stack.removeLast()
        let adder = item.0
        let level = item.1
        var sum = item.2
        
        sum += adder
        
        if level == numbers.count-1 {
            if sum == target { 
                result += 1
            }
        } else {
            stack.append((numbers[level+1], level+1, sum))
            stack.append((-numbers[level+1], level+1, sum))
        }
    }
    
    stack.append((-numbers[0], 0, 0))
    while !stack.isEmpty {
        let item = stack.removeLast()
        let adder = item.0
        let level = item.1
        var sum = item.2
        
        sum += adder
        
        if level == numbers.count-1 {
            if sum == target { 
                result += 1
            }
        } else {
            stack.append((numbers[level+1], level+1, sum))
            stack.append((-numbers[level+1], level+1, sum))
        }
    }
    
    return result
}