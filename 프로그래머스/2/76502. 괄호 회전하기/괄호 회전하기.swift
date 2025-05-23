import Foundation

func solution(_ s:String) -> Int {
    var result = 0
    var rotate = s
    
    if checkString(rotate) { result += 1 }
    
    for _ in 1..<s.count {
        let index = rotate.index(rotate.startIndex, offsetBy: 1)
        rotate = String((rotate + String(rotate.first!))[index...])
        if checkString(rotate) { result += 1 }
    }
    
    return result
}

func checkString(_ s: String) -> Bool {
    var stack: [Character] = []
    
    for c in s {
        if stack.isEmpty { stack.append(c) }
        else {
            let last = stack.last!
            if c == "(" || c == "[" || c == "{" { stack.append(c) }
            else {
                if (c == ")" && last == "(") || (c == "]" && last == "[") || (c == "}" && last == "{") { stack.removeLast() } else { return false }
            }
        }
    }
    
    return stack.isEmpty ? true : false
}