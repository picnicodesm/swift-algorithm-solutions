import Foundation

class Node {
    let data: Int
    var next: Node?
    var prev: Node?
    
    init(_ data: Int,
         next: Node?=nil,
         prev: Node?=nil) {
        self.data = data
        self.next = next
        self.prev = prev
    }
    
//    deinit {
//        print("data \(data) is deinit")
//    }
}

class RotationQueue {
    var head: Node? = nil
    var tail: Node? = nil
    
    func append(_ data: Int) {
        let newNode = Node(data)
        
        if head == nil && tail == nil {
            head = newNode
            tail = newNode
            head?.next = tail
            head?.prev = tail
            tail?.next = head
            tail?.prev = head
            return
        }
        
        tail?.next = newNode
        newNode.prev = tail
        newNode.next = head
        tail = newNode
        head?.prev = tail
    }
    
    func moveLeft() {
        if (head == nil && tail == nil) ||
            head === tail {
            return
        }
        
        head = head?.next
        tail = tail?.next
    }
    
    func moveRight() {
        if (head == nil && tail == nil) ||
            head === tail {
            return
        }
        
        head = head?.prev
        tail = tail?.prev
    }
    
    func pop() -> Int? {
        if head == nil && tail == nil { return nil }
        if head === tail {
            let output = head?.data
            head = nil
            tail = nil
            return output
        }
        
        let output = head?.data
        head?.next?.prev = tail
        tail?.next = head?.next
        head = head?.next
        return output
    }
    
    func printQueue() {
        var printNode = head
        
        if head == nil && tail == nil { return }
        if head === tail {
            print(head!.data)
            return
        }
        
        while printNode?.next !== head {
            print(printNode!.data, terminator: " ")
            printNode = printNode?.next
        }
        print(printNode!.data)
    }
    
    var headData: Int? {
        if head == nil && tail == nil {
            return nil
        }
        
        return head?.data
    }
    
    func searchLeft(_ data: Int) -> Int {
        var count = 0
        var searchNode = head
        
        while searchNode?.data != data {
            count += 1
            searchNode = searchNode?.prev
        }
        
        return count
    }
    
    func searchRight(_ data: Int) -> Int {
        var count = 0
        var searchNode = head
        
        while searchNode?.data != data {
            count += 1
            searchNode = searchNode?.next
        }
        
        return count
    }
    
    func rotateLeft(count: Int) {
        for _ in 0..<count {
            moveLeft()
        }
    }
    
    func rotateRight(count: Int) {
        for _ in 0..<count {
            moveRight()
        }
    }
}

var rotationQueue = RotationQueue()
let NM = readLine()!.split(separator: " ").map { Int(String($0))! }
var result = 0

for i in 1...NM[0] {
    rotationQueue.append(i)
}

let wanted = readLine()!.split(separator: " ").map { Int(String($0))! }
for i in wanted {
    let leftRotateCount = rotationQueue.searchLeft(i)
    let rightRotateCount = rotationQueue.searchRight(i)
    
    if leftRotateCount <= rightRotateCount {
        rotationQueue.rotateRight(count: leftRotateCount)
        _ = rotationQueue.pop()
        result += leftRotateCount
    } else {
        rotationQueue.rotateLeft(count: rightRotateCount)
        _ = rotationQueue.pop()
        result += rightRotateCount
    }
}

print(result)