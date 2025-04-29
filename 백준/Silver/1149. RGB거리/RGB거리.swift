import Foundation

let N = Int(readLine()!)!
var dp: [Int] = [0, 0, 0]

for _ in 0..<N {
    let cost = readLine()!.split(separator: " ").map { Int(String($0))! }
    let before = dp
    
    dp[0] = cost[0] + min(before[1], before[2])
    dp[1] = cost[1] + min(before[0], before[2])
    dp[2] = cost[2] + min(before[0], before[1])
}

print(dp.min()!)