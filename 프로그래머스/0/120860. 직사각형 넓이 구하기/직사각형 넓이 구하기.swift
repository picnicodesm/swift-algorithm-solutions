import Foundation

func solution(_ dots:[[Int]]) -> Int {
    let dots = dots.sorted(by: {$0[0] < $1[0]})

    let height = abs(dots[0][1] - dots[1][1])
    let width = dots[2][1] == dots[1][1] ? abs(dots[1][0] - dots[2][0]) : abs(dots[1][0] - dots[3][0])
    
    return height * width
}