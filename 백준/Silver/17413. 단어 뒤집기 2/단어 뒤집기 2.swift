import Foundation

let input = Array(readLine()!)
var result: [Character] = []
var stack: [Character] = []
var flag: Bool = false


for c in input {
    if c == "<" {
        while !stack.isEmpty {
            result.append(stack.popLast()!)
        }
        flag = true
    }
    
    if c == " " {
        if !flag {
            while !stack.isEmpty {
                result.append(stack.popLast()!)
            }
        }
        result.append(c)
        continue
    }
        

    if flag {
        result.append(c)
    } else {
        stack.append(c)
    }
    
    if c == ">" {
        flag = false
    }

}

while !stack.isEmpty {
    result.append(stack.popLast()!)
}


print(String(result))