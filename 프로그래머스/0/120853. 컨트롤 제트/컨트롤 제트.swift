import Foundation

func solution(_ s:String) -> Int {
    var stack: [Int] = []
    let s = s.split(separator: " ").map { String($0) }
    
    for c in s {
        if let n = Int(c) {
            stack.append(n)
        } else {
            stack.removeLast()
        }
    }
    
    return stack.reduce(0,+)
}