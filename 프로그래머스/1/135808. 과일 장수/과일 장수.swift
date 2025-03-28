import Foundation

func solution(_ k:Int, _ m:Int, _ score:[Int]) -> Int {
    var benefit = 0
    var startIndex = 0
    var orderedScore = score.sorted(by: >)
    
    while startIndex + m <= score.count {
    let lastIndex = startIndex + m
    let box = Array(orderedScore[startIndex..<lastIndex])
    let boxPrice = box[m-1] * m
        
    benefit += boxPrice
    startIndex = lastIndex        
    }
    
    return benefit
}