struct Stack {
    var stack: [Int] = []
    var total: Int = 0
    
    mutating func push(_ element: Int) {
        stack.append(element)
        total += element
    }
    
    mutating func pop() {
        let error = stack.popLast()!
        total -= error
    }
}

let N = Int(readLine()!)!
var stack = Stack()

for _ in 0..<N {
    let input = Int(readLine()!)!
    
    if input == 0 {
        stack.pop()
    } else {
        stack.push(input)
    }
}

print(stack.total)