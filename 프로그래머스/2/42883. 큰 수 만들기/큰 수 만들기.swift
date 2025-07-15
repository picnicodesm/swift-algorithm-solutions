import Foundation

func solution(_ number:String, _ k:Int) -> String {
    var remain = k
    var stack: [Character] = []
    
    for digit in number {
        while let top = stack.last, remain > 0, top < digit {
            stack.removeLast()
            remain -= 1
        }
        stack.append(digit)
    }
    
    stack.removeLast(remain)
    
    return String(stack)
}

