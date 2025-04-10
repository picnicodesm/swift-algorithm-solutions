import Foundation

func solution(_ s:String) -> Bool {
    var ans:Bool = true
    var stack: [Character] = []
    
    for c in s {
        if c == ")" {
            guard let last = stack.popLast(), last == "(" else {
                return false
            }
        } else {
            stack.append(c)
        }
    }
    
    if !stack.isEmpty { return false }
    
    return ans
}