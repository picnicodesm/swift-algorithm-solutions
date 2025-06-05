import Foundation

func solution(_ dirs:String) -> Int {
    var pos = (x: 0, y: 0)
    var visited = Set<Path>()
    var result = 0
    
    for direction in dirs {
        var movedPos = pos
        if direction == "U" { movedPos = (movedPos.x, movedPos.y+1) }
        if direction == "D" { movedPos = (movedPos.x, movedPos.y-1) }
        if direction == "R" { movedPos = (movedPos.x+1, movedPos.y) }
        if direction == "L" { movedPos = (movedPos.x-1, movedPos.y) }
        
        if isOnTheBoard(movedPos.x, movedPos.y) {
            let path1 = Path([pos.x, pos.y], [movedPos.x, movedPos.y])
            let path2 = Path([movedPos.x, movedPos.y], [pos.x, pos.y])
            pos = movedPos
            if !visited.contains(path1) && !visited.contains(path2) {
                result += 1
                visited.insert(path1)
            }
        }
    }
    
    return result
}

func isOnTheBoard(_ x: Int, _ y: Int) -> Bool {
    if x > 5 || y > 5 || x < -5 || y < -5 { return false }
    return true
}

struct Path: Hashable {
    let point1: [Int]
    let point2: [Int]
    
    init(_ p1: [Int], _ p2: [Int]) {
        point1 = p1
        point2 = p2
    }
}