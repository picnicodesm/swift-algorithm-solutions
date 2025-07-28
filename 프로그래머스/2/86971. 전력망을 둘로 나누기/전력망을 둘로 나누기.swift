import Foundation

func solution(_ n:Int, _ wires:[[Int]]) -> Int {
    var tree: [Int: [Int]] = [:]
    var minDiff = Int.max
    
    for wire in wires {
        tree[wire[0], default: []].append(wire[1])
        tree[wire[1], default: []].append(wire[0])
    }
    
    for wire in wires {
        minDiff = min(minDiff, abs(countNodes(tree, from: wire[0], except: wire[1]) - countNodes(tree, from: wire[1], except: wire[0])))
    }
    
    return minDiff
}

func countNodes(_ tree: [Int: [Int]], from node: Int, except: Int) -> Int {
    var visited: Set<Int> = []
    var num = 0
    var stack: [Int] = [node]
    
    while !stack.isEmpty {
        let nextNode = stack.removeLast()
        if !visited.contains(nextNode) {
            visited.insert(nextNode)
            num += 1
        } else { continue }
        
        guard let linkedNodes = tree[nextNode] else { return -1 }
        
        for node in linkedNodes {
            if !visited.contains(node) && node != except {
                stack.append(node)
            }
        }
    }
    
    return num
}
