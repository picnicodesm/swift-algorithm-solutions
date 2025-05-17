import Foundation

func solution(_ s:String) -> Int{
    var stack: [Character] = []
    
    for c in s {
        if let last = stack.last {
            if c == last { stack.removeLast() }
            else {stack.append(c) }
        } else {
            stack.append(c)
        }
    }
    
    return stack.isEmpty ? 1 : 0
}