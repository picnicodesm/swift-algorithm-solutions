import Foundation

func solution(_ n:Int, _ left:Int64, _ right:Int64) -> [Int] {
    var result: [Int] = []
    let bigN = Int64(n)
    
    for i in left...right {
        let row = Int(i / bigN)
        let col = Int(i % bigN)
        let element = col <= row ? row+1 : row+1+(col-row)
        result.append(element)
    }
    
    return result
}