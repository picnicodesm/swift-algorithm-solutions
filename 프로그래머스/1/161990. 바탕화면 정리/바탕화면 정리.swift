import Foundation

func solution(_ wallpaper:[String]) -> [Int] {
    var isStarted: Bool = false
    var xs = 0
    var xe = 0
    var yt = 0 
    var yb = 0
    
    for row in 0..<wallpaper.count {
        for (index, char) in wallpaper[row].enumerated() {
            if char == "#" {
                if !isStarted { 
                    yt = row 
                    yb = row+1
                    xs = index
                    xe = index+1
                    isStarted = true
                } else {
                    yb = row+1
                    xs = min(xs, index)
                    xe = max(xe, index+1)
                }
            }
        }
    }
    
    return [yt, xs, yb, xe]
}