import Foundation

func solution(_ land:[[Int]]) -> Int {
    var dp: [Int] = Array(repeating: 0, count: 4) // 각 열의 수의 최대값들을 저장하고 있음.
    
    for index in 0..<land.count {
        let line = land[index]
        let copy = dp
        dp[0] = line[0] + max(copy[1], copy[2], copy[3])
        dp[1] = line[1] + max(copy[0], copy[2], copy[3])
        dp[2] = line[2] + max(copy[0], copy[1], copy[3])
        dp[3] = line[3] + max(copy[0], copy[1], copy[2])
    }

    
    return dp.max()!
}