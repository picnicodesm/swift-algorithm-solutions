import Foundation

typealias Pos = (row: Int, col: Int)

func solution(_ storage:[String], _ requests:[String]) -> Int {
    var storage: [[Character]] = storage.map { Array($0) }
    var dic: [String: [Pos]] = [:]
    var result = 0
    
    for row in 0..<storage.count {
        for col in 0..<storage[0].count {
            dic[String(storage[row][col]), default: []].append((row, col))
        }
    }
    
    for request in requests {
        if request.count == 1 {
            storage = forklift(request: request, in: storage, ref: dic)
        } else { 
            storage = crain(request: request, in: storage, ref: dic)
        }
    }
    
    for row in 0..<storage.count {
        for col in 0..<storage[0].count {
            if storage[row][col] != "!" { 
                result += 1
            }
        }
    }
    
    return result
}

func forklift(request: String, in storage: [[Character]], ref dic: [String: [Pos]]) -> [[Character]] {
    var storage = storage
    var canLift: [Pos] = []
    
    guard let positions = dic[request] else { return storage }
    
    for pos in positions {
        if storage[pos.row][pos.col] != "!" && findRoad(from: pos, in: storage) {
            canLift.append(pos)
        }
    }
    
    for lift in canLift {
        storage[lift.row][lift.col] = "!"
    }

    return storage
}

func crain(request: String, in storage: [[Character]], ref dic: [String: [Pos]]) -> [[Character]] {
    var storage = storage
    
    guard let positions = dic[String(request.first!)] else { return storage }
    
    for pos in positions {
        storage[pos.row][pos.col] = "!"
    }

    return storage
}

func findRoad(from pos: Pos, in storage: [[Character]]) -> Bool {
    var stack: [Pos] = [] // 다음에 방문할 위치를 받음
    let direction = [(-1, 0), (1, 0), (0, -1), (0, 1)]
    var visited: [[Bool]] = Array(repeating: Array(repeating: false, count: storage[0].count), count: storage.count)
    
    stack.append(pos)
    
    while !stack.isEmpty {
        let nextPos = stack.removeLast()
        visited[nextPos.row][nextPos.col] = true
        
        // 외부와 연결됨
        if nextPos.row <= 0 || nextPos.row >= storage.count - 1 || 
        nextPos.col <= 0 || nextPos.col >= storage[0].count - 1 {
            return true
        }
        
        for dir in direction {
            let nextPos: Pos = (nextPos.row + dir.0, nextPos.col + dir.1)
            if !visited[nextPos.row][nextPos.col] && storage[nextPos.row][nextPos.col] == "!" {
                stack.append(nextPos)
            }
        }
    }
    
    // dfs가 끝났는데도 찾지 못한 경우
    return false
}
