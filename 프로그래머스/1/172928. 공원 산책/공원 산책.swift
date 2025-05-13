import Foundation

func solution(_ park:[String], _ routes:[String]) -> [Int] {
    
    var result: [Int] = [0, 0]
    let width = park[0].count
    let height = park.count
    
    for i in 0..<park.count {
        if let startXIndex = park[i].firstIndex(of: "S") {
            let startX = park[i].distance(from: park[i].startIndex, to: startXIndex)
            result = [i, startX]
            break
        }
    }
    
    for route in routes {
        // E: [1]+, W: [1]-, S: [0]+, N: [0]-
        let command = route.split(separator: " ").map { String($0) }
        let direction = command[0]
        let step = Int(command[1])!
        
        if direction == "E" {
            if result[1] + step >= width { continue }
            let posx = park[result[0]].index(park[result[0]].startIndex, offsetBy: result[1])
            let movedx = park[result[0]].index(posx, offsetBy: step)
            if park[result[0]][posx...movedx].contains("X") { continue }
            
            result[1] += step
        } else if direction == "W" {
            if result[1] - step < 0 { continue }
            let posx = park[result[0]].index(park[result[0]].startIndex, offsetBy: result[1])
            let movedx = park[result[0]].index(posx, offsetBy: -step)
            if park[result[0]][movedx..<posx].contains("X") { continue }
            
            result[1] -= step
        } else if direction == "S" {
            if result[0] + step >= height { continue }
            var flag = true
            for i in 1...step {
                let posx = park[result[0]+i].index(park[result[0]+i].startIndex, offsetBy: result[1])
                if park[result[0]+i][posx] == "X" { 
                    flag = false
                    break 
                }
            }
            if flag { result[0] += step }
        } else if direction == "N" {
            if result[0] - step < 0 { continue }
            var flag = true
            for i in 1...step {
                let posx = park[result[0]-i].index(park[result[0]-i].startIndex, offsetBy: result[1])
                if park[result[0]-i][posx] == "X" { 
                    flag = false
                    continue
                }
            }
            
            if flag { result[0] -= step }
        }
    }
    
    return result
}