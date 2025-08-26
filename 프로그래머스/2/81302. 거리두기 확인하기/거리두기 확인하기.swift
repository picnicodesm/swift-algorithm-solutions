import Foundation

typealias Pos = (row: Int, col: Int)

func solution(_ places:[[String]]) -> [Int] {
    var result: [Int] = []
    
    for room in places {
        let room: [[String]] = room.map { $0.map { String($0) } }
        let isSatisfy = check(room)
        result.append(isSatisfy)
    }
    
    return result
}

func check(_ room: [[String]]) -> Int {

    var visited = Array(repeating: Array(repeating: false, count: room.first!.count), count: room.count)
    let directions = [(1, 0), (-1, 0), (0, 1), (0, -1), (1, 1), (-1, 1), (1, -1), (-1, -1), (2, 0), (-2, 0), (0, 2), (0, -2)]
    
    func lookAround(at pos: Pos) -> Bool {
        
        for direction in directions {
            let lookPosition: Pos = (pos.row + direction.0, pos.col + direction.1)
            
            if isInTheRoom(lookPosition) && 
            room[lookPosition.0][lookPosition.1] == "P" && 
            !visited[lookPosition.0][lookPosition.1] {
                if getDistance(pos, lookPosition) == 1 { 
                    return false
                } else { // 거리가 2인 경우
                    if pos.row == lookPosition.row { 
                        let middle = (pos.col + lookPosition.col) / 2
                        if room[pos.row][middle] != "X" { return false}
                    } else if pos.col == lookPosition.col {
                        let middle = (pos.row + lookPosition.row) / 2
                        if room[middle][pos.col] != "X" { return false}
                    } else {
                        if !(room[pos.row][lookPosition.col] == "X" && room[lookPosition.row][pos.col] == "X") { return false }
                    }
                }
                
            }
        }
        
        return true
    }
    
    
    for row in 0..<room.count {
        for col in 0..<room.first!.count {
            if room[row][col] == "P" {
                visited[row][col] = true
                if !lookAround(at: (row, col)) {
                    return 0
                }
            }
        }
    }
    
    return 1
}

func isInTheRoom(_ pos: Pos) -> Bool {
    return (0..<5).contains(pos.0) && (0..<5).contains(pos.1)
}

func getDistance(_ p1: Pos, _ p2: Pos) -> Int {
    return abs(p1.row - p2.row) + abs(p1.col - p2.col)
}