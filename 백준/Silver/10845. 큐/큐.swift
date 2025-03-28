import Foundation

struct Queue {
    private var input: [Int] = []
    private var output: [Int] = []
    
    mutating func push(_ element: Int) {
        input.append(element)
    }
    
    mutating func pop() -> Int {
        if output.isEmpty {
            output = input.reversed()
            input = []
        }
        
        return output.popLast() ?? -1
    }
    
    var front: Int {
        if isEmpty { return -1 }
        if output.isEmpty {
            return input[0]
        } else {
            return output.last!
        }
    }
    
    var back: Int {
        if isEmpty { return -1 }
        if input.isEmpty {
            return output[0]
        } else {
            return input.last!
        }
    }
    
    var size: Int { input.count +  output.count }
    var isEmpty: Bool { input.isEmpty && output.isEmpty }
    var empty: Int { return isEmpty ? 1 : 0 }
}

enum Command: String {
    case push
    case pop
    case front
    case back
    case size
    case empty
}

let N = Int(readLine()!)!
var queue = Queue()

for _ in 0..<N {
    let commandLine = readLine()!.split(separator: " ").map { String($0) }
    let command = Command(rawValue: commandLine[0])!
    
    switch command {
    case .push:
        queue.push(Int(commandLine[1])!)
    case .pop:
        print(queue.pop())
    case .front:
        print(queue.front)
    case .back:
        print(queue.back)
    case .size:
        print(queue.size)
    case .empty:
        print(queue.empty)
    }
}