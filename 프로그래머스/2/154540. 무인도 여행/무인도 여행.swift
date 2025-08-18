import Foundation

typealias Pos = (row: Int, col: Int)

func solution(_ maps:[String]) -> [Int] {
    let map: [[String]] = maps.map { $0.map { String($0) } }
    var visited: [[Bool]] = Array(repeating: Array(repeating: false, count: map.first!.count), count: map.count)
    var result: [Int] = []
    
    func searchIsland(from pos: Pos, in map: [[String]]) -> Int {
        var stack: [Pos] = []
        var result = 0
        
        stack.append(pos)
        print("search from: \(pos)")
        while !stack.isEmpty {
            let pos = stack.removeLast()
            if visited[pos.row][pos.col] { continue }
            else { visited[pos.row][pos.col] = true }
            
            result += Int(map[pos.row][pos.col])!
            
            let nextPos = getNextPos(of: pos).filter { 
                checkValidation(of: $0, in: map) && !visited[$0.row][$0.col] && map[$0.row][$0.col] != "X"
            }
            
            nextPos.forEach { stack.append($0) }
        }

        return result
    }

        
    for row in 0..<map.count {
        for col in 0..<map.first!.count {
            if !visited[row][col] && Int(map[row][col]) != nil  {
                let n = searchIsland(from: (row, col), in: map)
                result.append(n)
            }
        }
    }
        
    result = result.sorted()
    
    return result.isEmpty ? [-1] : result
}

func checkValidation(of pos: Pos, in map: [[String]]) -> Bool {    
    return (0..<map.count).contains(pos.row) && (0..<map.first!.count).contains(pos.col) 
}

func getNextPos(of pos: Pos) -> [Pos] {
    let directions = [(-1, 0), (1, 0), (0, -1), (0, 1)] // up down left right
    
    return directions.map { (pos.row + $0.0, pos.col + $0.1) }
}

