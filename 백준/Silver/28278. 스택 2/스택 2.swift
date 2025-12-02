enum Command: Int {
    case push = 1
    case pop
    case count
    case isEmpty
    case top
}

struct Stack {
    var stack: [Int] = []
    
    mutating func push(_ element: Int) {
        stack.append(element)
    }
    
    mutating func pop() -> Int {
        if stack.isEmpty {
            return -1
        } else {
            return stack.popLast()!
        }
    }
    
    func count() -> Int {
        return stack.count
    }
    
    func isEmpty() -> Int {
        return stack.isEmpty ? 1 : 0
    }
    
    func top() -> Int {
        return stack.isEmpty ? -1 : stack.last!
    }
}

let N = Int(readLine()!)!
var stack = Stack()

for _ in 0..<N {
    let input = readLine()!.split(separator: " ").map { Int(String($0))! }
    
    let command = Command(rawValue: input[0])!
    switch command {
    case .push:
        stack.push(input[1])
    case .pop:
        print(stack.pop())
    case .count:
        print(stack.count())
    case .isEmpty:
        print(stack.isEmpty())
    case .top:
        print(stack.top())
    }
}