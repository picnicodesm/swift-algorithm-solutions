import Foundation

func solution(_ r1:Int, _ r2:Int) -> Int64 {
    
    var pointsInC1: Int64 = 0
    var pointsInC2: Int64 = 0
    
    if r1 > 1 {
        for x in 1..<r1 {
            let rSquare = Int64(r1 * r1)
            let xSquare = Int64(x * x)
            let maxY = Int64(sqrt(Double(rSquare - xSquare)))
            let isOnTheCircle = maxY * maxY == rSquare - xSquare
            pointsInC1 += isOnTheCircle ? maxY - 1 : maxY
        }
    }           
    
    if r2 > 1 {
        for x in 1..<r2 {
            let rSquare = Int64(r2 * r2)
            let xSquare = Int64(x * x)
            pointsInC2 += Int64(sqrt(Double(rSquare - xSquare)))
        }
    }
    
    return (pointsInC2 - pointsInC1 + Int64(r2 - r1 + 1)) * 4
}



