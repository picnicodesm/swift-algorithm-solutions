import Foundation

func solution(_ score:[[Int]]) -> [Int] {
    let totalScores = score.map { $0[0] + $0[1] }
    
    let sortedScores = totalScores.sorted(by: >)
    
    return totalScores.map { sortedScores.firstIndex(of: $0)! + 1 }
}