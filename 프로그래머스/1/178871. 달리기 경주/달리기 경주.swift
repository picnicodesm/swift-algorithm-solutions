import Foundation

func solution(_ players:[String], _ callings:[String]) -> [String] {
    var result: [String] = players
    var dic: [String: Int] = [:]
    
    for index in 0..<players.count {
        dic[players[index]] = index
    }
    
    for called in callings {
        let rank = dic[called]!
        let toFront = result[rank]
        let toBack = result[rank-1]
        
        result.swapAt(rank, rank-1)
        
        dic[toFront]! -= 1
        dic[toBack]! += 1
    }
    
    return result
}