import Foundation

func solution(_ n:Int) -> [[Int]] {
    var dp: [String: [[Int]]] = [
        "1to2": [[1, 2]],
        "1to3": [[1, 3]],
        "2to3": [[2, 3]],
        "2to1": [[2, 1]],
        "3to1": [[3, 1]],
        "3to2": [[3, 2]],
    ]
    
    for i in 1..<n {
        let temp = dp
        dp["1to2"]! = temp["1to3"]! + [[1, 2]] + temp["3to2"]!
        dp["1to3"]! = temp["1to2"]! + [[1, 3]] + temp["2to3"]!
        dp["2to3"]! = temp["2to1"]! + [[2, 3]] + temp["1to3"]!
        dp["2to1"]! = temp["2to3"]! + [[2, 1]] + temp["3to1"]!
        dp["3to1"]! = temp["3to2"]! + [[3, 1]] + temp["2to1"]!
        dp["3to2"]! = temp["3to1"]! + [[3, 2]] + temp["1to2"]!
    }
    
    return dp["1to3"]!
}