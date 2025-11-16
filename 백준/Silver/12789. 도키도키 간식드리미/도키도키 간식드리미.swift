struct Stack {
    var stack: [Int] = []
    
    mutating func push(_ element: Int) {
        stack.append(element)
    }
    
    mutating func pop() -> Int? {
        return stack.popLast()
    }
    
    var last: Int? {
        return stack.last
    }
    
    var count: Int {
        return stack.count
    }
    
    var isEmpty: Bool {
        return stack.isEmpty
    }
}

let N = Int(readLine()!)!
var currentNumber = 1
var input: Stack = .init(stack: readLine()!.split(separator: " ").map { Int(String($0))! }.reversed()  )
var successLine = Stack()
var waitingLine = Stack()

while true {
    if successLine.count == N {
        print("Nice")
        break
    }
    
    if input.isEmpty && waitingLine.last != currentNumber {
        print("Sad")
        break
    }
    
    if let waitingNumber = waitingLine.last, currentNumber == waitingNumber {
        let move = waitingLine.pop()!
        successLine.push(move)
        currentNumber += 1
    } else if let waitingNumber = input.last {
        let move = input.pop()!
        if waitingNumber == currentNumber {
            successLine.push(move)
            currentNumber += 1
        } else {
            waitingLine.push(move)
        }
    }
}