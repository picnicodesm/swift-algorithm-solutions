struct VPSStack {
    var stack: [Character] = []
    
    var isVPS: String {
        return stack.isEmpty ? "YES" : "NO"
    }
    
    mutating func push(_ element: Character) {
        if element == "(" {
            stack.append(element)
        } else {
            if let last = stack.last, last == "(" {
                    let _ = stack.popLast()
            } else {
                stack.append(element)
            }
        }
    }
    
    mutating func makeEmpty() {
        stack = []
    }
}

let N = Int(readLine()!)!
var vpsStack = VPSStack()

for _ in 0..<N {
    vpsStack.makeEmpty()
    let _ = readLine()!.map { vpsStack.push($0) }
    print(vpsStack.isVPS)
}