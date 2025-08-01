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

// 한 마을에서 다른 모든 마을까지 가는 경로를 구하는 알고리즘
// 다익스트라: 한 노드에서 나들ㄴ 모든 노드까지의 최단거리 O(NlogE) <- 근데 이건 우선순위 큐, 그냥 하면 VE일것. 근데 E는 V2이므로 V3 -> 그래도 가능
// 다익스트라가... 그리디였나?
// 두 마을을 연결하는 도로는 여러개일 수 있음