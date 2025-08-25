import Foundation

func solution(_ p:String) -> String {
    
    if isRightBalancedString(p) { return p }
    
    let result = convert(p)

    return result
}

func convert(_ s: String) -> String {
    if s.isEmpty { return "" }
    
    var (u, v) = divide(s)
    print(u, v)
    if isRightBalancedString(String(u)) {
        let result = convert(String(v))
        
        return String(u) + result
    } else {
        let subString = convert(String(v))
        var result = "(" + subString + ")"

        u.removeFirst()
        u.removeLast()
        u = u.map { 
            if $0 == "(" { return ")"}
            else { return "("}
        }

        return result + u
    }
}

func divide(_ s: String) -> ([Character], [Character]) {
    let p: [Character] = Array(s)
    var u: [Character] = []
    var v: [Character] = []
    
    for (i, c) in p.enumerated() {
        u.append(c)
        if isBalancedString(String(u)) {
            if i == p.count - 1 { break }
            
            let index = p.index(p.startIndex, offsetBy: i+1)
            v = Array(p[index...])
            break
        }
    }
    
    return (u, v)
}

func isBalancedString(_ s: String) -> Bool {
    var leftParentheses = 0
    var rightParentheses = 0
    
    if s.isEmpty { return false }
    
    for c in s {
        if c == "(" { leftParentheses += 1 }
        else { rightParentheses += 1 }
    }
    
    return leftParentheses == rightParentheses
}

func isRightBalancedString(_ s: String) -> Bool {
    if !isBalancedString(s) { return false }
    
    var stack: [Character] = [] 
    
    for c in s {
        if c == "(" { stack.append(c) }
        else { 
            if stack.isEmpty { return false }
            else { stack.removeLast() }
        }
    }
        
    return stack.isEmpty
}