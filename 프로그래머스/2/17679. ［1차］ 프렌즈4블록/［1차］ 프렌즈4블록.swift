func solution(_ m:Int, _ n:Int, _ board:[String]) -> Int {
    var removeSet = Set<Position>()
    var newBoard: [[Character]] = []
    var toTheNext = true
    var result = 0

    func isBlock(_ pos: (x: Int, y: Int), with c: Character) -> Bool {
        if c == " " { return false }
        if pos.x == n-1 || pos.y == m-1 { return false }
        
        if newBoard[pos.y][pos.x+1] == c && 
        newBoard[pos.y+1][pos.x+1] == c && 
        newBoard[pos.y+1][pos.x] == c { return true }
        
        return false 
    }
    
    for line in board {
        let line: [Character] = Array(line)
        newBoard.append(line)
    }
    
    while toTheNext {
        toTheNext = false
        
        for y in 0..<m-1 {
            for x in 0..<n-1 {
                if isBlock((x, y), with: newBoard[y][x]) {
                    toTheNext = true
                    removeSet.insert(Position(x, y))
                    removeSet.insert(Position(x, y+1))
                    removeSet.insert(Position(x+1, y))
                    removeSet.insert(Position(x+1, y+1))
                }
            }
        }
        
        if !toTheNext { break }
        
        // 블럭 지우기
        for pos in removeSet { 
            newBoard[pos.y][pos.x] = " "
            result += 1
        }
        
        // 블럭 내리기
        for x in 0..<n {
            var lookY = m-1
            var putY = m-1
            
            while lookY >= 0 && newBoard[lookY][x] != " " {
                lookY -= 1
                putY -= 1
            }
            
            while lookY >= 0 {
                if newBoard[lookY][x] == " " { lookY -= 1 }
                else {
                    newBoard[putY][x] = newBoard[lookY][x]
                    newBoard[lookY][x] = " "
                    putY -= 1
                    lookY -= 1
                }       
            }
        }
        
        removeSet = []
    }
    
    
    return result
}

struct Position: Hashable {
    let x: Int
    let y: Int
    
    init(_ x: Int, _ y: Int) {
        self.x = x
        self.y = y
    }
}
