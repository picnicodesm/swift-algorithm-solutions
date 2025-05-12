import Foundation

func solution(_ n: Int) -> Int {
    var dp:[Int] = [0, 1, 2]
    
    if n < 3 { return dp[n] }
    
    for i in 2..<n {
        dp.append((dp[i]+dp[i-1]) % 10007)
    }
    
    return dp[n]
}

let input = Int(readLine()!)!
print(solution(input))