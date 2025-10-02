import Foundation

func solution(_ keyinput:[String], _ board:[Int]) -> [Int] {
    var pos = [0, 0]
    
    for input in keyinput {
        let temp = pos
        
        if input == "up" { pos[1] += 1 }
        else if input == "down" { pos[1] -= 1 }
        else if input == "left" { pos[0] -= 1 }
        else { pos[0] += 1 }
        
        if !inTheBoard(pos, board) { 
            pos = temp
        }
    }
    
    return pos
}

func inTheBoard(_ pos: [Int], _ size: [Int]) -> Bool {
    let widthMax = size[0] / 2
    let heightMax = size[1] / 2

    return !(pos[0] < -widthMax || pos[0] > widthMax || pos[1] < -heightMax || pos[1] > heightMax)
}