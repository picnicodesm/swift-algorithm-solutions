import Foundation

func solution(_ survey:[String], _ choices:[Int]) -> String {
    var dic: [Character: Int] = [
        "R": 0, "T": 0, "C": 0, "F": 0, "J": 0, "M": 0, "A": 0, "N": 0
    ]
    let score: [Int] = [3, 2, 1, 0, 1, 2, 3]
    var result: [Character] = ["R", "C", "J", "A"]
    
    for (type, choice) in zip(survey, choices) {
        if choice < 4 {
            dic[type.first!]! += score[choice-1]
        } else if choice > 4 {
            dic[type.last!]! += score[choice-1]
        }        
    }
    
    result[0] = dic["R"]! >= dic["T"]! ? "R" : "T"
    result[1] = dic["C"]! >= dic["F"]! ? "C" : "F"
    result[2] = dic["J"]! >= dic["M"]! ? "J" : "M"
    result[3] = dic["A"]! >= dic["N"]! ? "A" : "N"
    
    return String(result)
}