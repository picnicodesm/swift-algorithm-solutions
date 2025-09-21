import Foundation

func solution(_ numbers:String) -> Int64 {
    let dic = [
        "zero": 0,
        "one": 1,
        "two": 2,
        "three": 3,
        "four": 4,
        "five": 5,
        "six": 6,
        "seven": 7,
        "eight": 8,
        "nine": 9
    ]
    var stack: [Character] = []
    var result: [Int] = []
    
    for c in numbers {
        stack.append(c)
        
        if stack.count >= 3 {
            let key1 = String(stack.suffix(3)) 
            if let n = dic[key1] {
                result.append(n)
                stack.removeLast(3)
                continue
            }
            
            let key2 = String(stack.suffix(4))
            if let n = dic[key2] {
                result.append(n)
                stack.removeLast(4)
                continue
            }
            
            let key3 = String(stack.suffix(5))
            if let n = dic[key3] {
                result.append(n)
                stack.removeLast(5)
                continue
            }
        }
    }
    
    return Int64(result.map { String($0) }.joined())!
}