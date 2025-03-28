import Foundation

func solution(_ k:Int, _ score:[Int]) -> [Int] {
    
    var list: [Int] = []
    var result: [Int] = []
    
    for scoreOfTheDay in score {
        list.append(scoreOfTheDay)
        list = list.sorted(by: >)
        
        if list.count <= k {
            result.append(list[list.count-1])
        } else {
            list = Array(list[0..<k])
            result.append(list[k-1])
        }
    }
    
    return result
}