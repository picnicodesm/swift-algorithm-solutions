func testWindow(window: [[Character]], startIndeRow rowIndex: Int, startIndexColumn columnIndex: Int) -> Int {
    let windowSize = 8
    var errors: [Int] = []
    
    for c in ["W", "B"] {
        let initialCharacter = Character(c)
        var error = 0
        for row in 0..<windowSize {
            for col in 0..<windowSize {
                if (row + col) % 2 == 0 {
                    if window[rowIndex + row][columnIndex + col] != initialCharacter {
                        error += 1
                    }
                } else {
                    if window[rowIndex + row][columnIndex + col] == initialCharacter {
                        error += 1
                    }
                }
            }
        }
        errors.append(error)
    }
    
    return errors.min()!
}

let MN = readLine()!.split(separator: " ").map { Int(String($0))! }
var board: [[Character]] = []
var errors: [Int] = []

for _ in 0..<MN[0] {
    let line = Array(readLine()!)
    board.append(line)
}

for row in 0...MN[0]-8 {
    for col in 0...MN[1]-8 {
        let error = testWindow(window: board, startIndeRow: row, startIndexColumn: col)
        errors.append(error)
    }
}

print(errors.min()!)
