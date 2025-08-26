import Foundation

typealias Pos = (r: Int, c: Int)

func solution(_ places:[[String]]) -> [Int] {
    return places.map { place in
        let room = place.map { Array($0) }
        return checkRoom(room)
    }
}

func checkRoom(_ room: [[Character]]) -> Int {
    for r in 0..<5 {
        for c in 0..<5 {
            if room[r][c] == "P" {
                if !bfs(room, (r, c)) {
                    return 0
                }
            }
        }
    }
    return 1
}

func bfs(_ room: [[Character]], _ startPos: Pos) -> Bool {
    let dx = [0, 0, 1, -1]
    let dy = [1, -1, 0, 0]
    
    var queue: [(pos: Pos, dist: Int)] = [(startPos, 0)]
    var visited = Array(repeating: Array(repeating: false, count: 5), count: 5)
    visited[startPos.r][startPos.c] = true
    
    var head = 0
    while head < queue.count {
        let (current, dist) = queue[head]
        head += 1
        
        if dist == 2 {
            continue
        }
        
        for i in 0..<4 {
            let nextR = current.r + dx[i]
            let nextC = current.c + dy[i]
            
            if nextR < 0 || nextR >= 5 || nextC < 0 || nextC >= 5 {
                continue
            }
            
            if visited[nextR][nextC] {
                continue
            }
            
            if room[nextR][nextC] == "X" {
                continue
            }
            
            if room[nextR][nextC] == "P" {
                return false
            }
            
            visited[nextR][nextC] = true
            queue.append(((nextR, nextC), dist + 1))
        }
    }
    
    return true
}