import Foundation

let N = Int(readLine()!)!
solution(N)


struct Deque {
    var frontStack: [Int] = []
    var backStack: [Int] = []
    
    mutating func push_front(_ element: Int) {
        frontStack.append(element)
    }
    
    mutating func push_back(_ element: Int) {
        backStack.append(element)
    }
    
    mutating func pop_front() -> Int {
        if frontStack.isEmpty {
            frontStack = backStack.reversed()
            backStack = []
            return frontStack.popLast() ?? -1
        } else {
            return frontStack.popLast()!
        }
    }
    
    mutating func pop_back() -> Int {
        if backStack.isEmpty {
            backStack = frontStack.reversed()
            frontStack = []
            return backStack.popLast() ?? -1
        } else {
            return backStack.popLast()!
        }
    }
    
    var size: Int {
        return frontStack.count + backStack.count
    }
    
    var empty: Int {
        return frontStack.isEmpty && backStack.isEmpty ? 1 : 0
    }
    
    var front: Int {
        if frontStack.isEmpty {
            return backStack.first ?? -1
        } else {
            return frontStack.last!
        }
    }
    
    var back: Int {
        if backStack.isEmpty {
            return frontStack.first ?? -1
        } else {
            return backStack.last!
        }
    }
}

enum Command: String {
    case push_front
    case push_back
    case pop_front
    case pop_back
    case size
    case empty
    case front
    case back
}

func solution(_ N: Int) {
    var deque = Deque()
    
    for _ in 0..<N {
        let commandLine = readLine()!.split(separator: " ").map { String($0) }
        let command = Command(rawValue: commandLine[0])!
        
        switch command {
        case .push_front:
            deque.push_front(Int(commandLine[1])!)
        case .push_back:
            deque.push_back(Int(commandLine[1])!)
        case .pop_front:
            print(deque.pop_front())
        case .pop_back:
            print(deque.pop_back())
        case .size:
            print(deque.size)
        case .empty:
            print(deque.empty)
        case .front:
            print(deque.front)
        case .back:
            print(deque.back)
        }
    }
}