import Foundation

struct Queue {
    var queue: [State] = []
    var head: Int = 0
    var tail: Int = -1
    var isEmpty: Bool {
        return head > tail
    }
    
    mutating func enqueue(_ e: State) {
        queue.append(e)
        tail += 1
    }
    
    mutating func dequeue() -> State? {
        if isEmpty { return nil }
        
        let output = queue[head]
        head += 1
        
        if head > tail { makeEmpty() }
        
        return output
    }
    
    mutating func makeEmpty() {
        queue = []
        head = 0
        tail = -1
    }
}

typealias Pos = (row: Int, col: Int)

func solution(_ maps:[String]) -> Int {    
    var queue: Queue = Queue()
    var start: Pos = (-1, -1)
    var map: [[Character]] = []
    var isLeverFound = false
    var visited: [[Bool]] = Array(repeating: Array(repeating: false, count: maps[0].count), count: maps.count)

    
    func canMove(to pos: Pos) -> Bool {
        return pos.row >= 0 && 
        pos.row < map.count && 
        pos.col >= 0 && 
        pos.col < map[0].count && 
        map[pos.row][pos.col] != "X"
    }
    
    for line in maps {
        map.append(Array(line))
    }
    
    // find start, lever, exit
    for row in 0..<map.count {
        for col in 0..<map[0].count {
            if map[row][col] == "S" { start = (row, col) }
        }
    }
    
    queue.enqueue(State(move: 0, pos: start, from: start))
    
    while !queue.isEmpty {
        let state = queue.dequeue()!
        let pos = state.pos
        let block = map[pos.row][pos.col]

        if visited[pos.row][pos.col] { continue }
        else { visited[pos.row][pos.col] = true }
        
        if block == "L" {
            isLeverFound = true
            queue.makeEmpty()
            visited = Array(repeating: Array(repeating: false, count: maps[0].count), count: maps.count)
        } else if block == "E" {
            if isLeverFound { 
                return state.move
            }
        }
        
        let nextPos: [Pos] = [
            (pos.row - 1, pos.col),
            (pos.row + 1, pos.col),
            (pos.row, pos.col - 1),
            (pos.row, pos.col + 1)
        ].filter { 
            if block == "L" { return canMove(to: $0) }
            else { return $0 != state.from && canMove(to: $0) }
        }
        
        for next in nextPos {
            queue.enqueue(State(move: state.move + 1, pos: next, from: pos))
        }
    }

    return -1
}

struct State {
    let move: Int
    let pos: Pos
    let from: Pos
}
