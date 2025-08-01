import Foundation

func solution(_ N:Int, _ road:[[Int]], _ k:Int) -> Int {
    var answer = 0
    var edges: [Int: [Int]] = [:] 
    var visited: [Bool] = Array(repeating: false, count: N+1)
    
    visited[1] = true
    
    for i in 1...N {
        edges[i] = Array(repeating: Int.max/2, count: N+1)
        edges[i]![i] = 0
    }
    
    for roadInfo in road {
        let cost = edges[roadInfo[0]]![roadInfo[1]]
        edges[roadInfo[0]]![roadInfo[1]] = min(cost, roadInfo[2])
        edges[roadInfo[1]]![roadInfo[0]] = min(cost, roadInfo[2])
    }

    for _ in 0..<N-1 {
        let notVisited = visited.indices.filter { $0 != 0 && !visited[$0] }
        let nextNode = notVisited.sorted(by: { edges[1]![$0] < edges[1]![$1] }).first!
        visited[nextNode] = true
        
        for i in 2...N {
            edges[1]![i] = min(edges[1]![i], edges[1]![nextNode] + edges[nextNode]![i])
        }
    }
    
    for cost in edges[1]! {
        if cost <= k { answer += 1 }
    }

    return answer
}
