import Foundation

class Node {
    let data: String
    var leftChild: Node?
    var rightChild: Node?
    
    init(_ data: String, left: Node? = nil, right: Node? = nil) {
        self.data = data
        leftChild = left
        rightChild = right
    }
}

class Tree {
    var root: Node? = nil
    
    func preOrder(from node: Node?) {
        guard let node = node else { return }
        print(node.data, terminator: "")
        preOrder(from: node.leftChild)
        preOrder(from: node.rightChild)
    }
    
    func InOrder(from node: Node?) {
        guard let node = node else { return }
        InOrder(from: node.leftChild)
        print(node.data, terminator: "")
        InOrder(from: node.rightChild)
    }
    
    func postOrder(from node: Node?) {
        guard let node = node else { return }
        postOrder(from: node.leftChild)
        postOrder(from: node.rightChild)
        print(node.data, terminator: "")
    }
}

let numberOfNode = Int(readLine()!)!
var nodes: [String: Node] = [:]

for _ in 0..<numberOfNode {
    let input = readLine()!.split(separator: " ").map { String($0) }
  
    let leftChild = Node(input[1])
    let rightChild = Node(input[2])
    if nodes[input[0]] == nil { nodes[input[0]] = Node(input[0]) }
    if nodes[input[1]] == nil { nodes[input[1]] = leftChild }
    if nodes[input[2]] == nil { nodes[input[2]] = rightChild }
    
    nodes[input[0]]?.leftChild = input[1] == "." ? nil : leftChild
    nodes[input[0]]?.rightChild = input[2] == "." ? nil : rightChild
}

var tree = Tree()
tree.root = nodes["A"]
tree.preOrder(from: tree.root)
print("")
tree.InOrder(from: tree.root)
print("")
tree.postOrder(from: tree.root)