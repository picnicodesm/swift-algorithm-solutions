import Foundation

func solution(_ score:[[Int]]) -> [Int] {
    var result: [Int] = Array(repeating: 0, count: score.count)
    
    var ordered = score.sorted(by: { (Double($0[0]) + Double($0[1])) / 2 > (Double($1[0]) + Double($1[1])) / 2})
    var rank = 1
    var avg: Double = -1
    
    for index in 0..<ordered.count {
        let item = ordered[index]
        let newAvg: Double = (Double(item[0]) + Double(item[1])) / 2
        if newAvg != avg { 
            avg = newAvg
            rank = index + 1
        }
        
        for i in 0..<score.count {
           if item == score[i] {
               result[i] = rank
           }
        }
    }
    
    return result
}