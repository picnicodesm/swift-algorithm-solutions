import Foundation

struct Editor {
    var left: [Character] = []
    var right: [Character] = []
    
    mutating func input(_ char: Character) {
        left.append(char)
    }
    
    mutating func moveLeft() {
        if let lastCharacter = left.popLast() {
            right.append(lastCharacter)
        }
    }
    
    mutating  func moveRight() {
        if let lastCharacter = right.popLast() {
            left.append(lastCharacter)
        }
    }
    
    mutating func remove() {
        _ = left.popLast()
    }
    
    func print() -> String {
        return String(left + right.reversed())
    }
}

func solution(_ string: String) -> String {
    var editor = Editor()
    
    for command in string {
        switch command {
        case "<":
            editor.moveLeft()
        case ">":
            editor.moveRight()
        case "-":
            editor.remove()
        default:
            editor.input(command)
        }
    }
    
    return editor.print()
}

let N = Int(readLine()!)!

for _ in 0..<N {
    let input = readLine()!
    print(solution(input))
}
