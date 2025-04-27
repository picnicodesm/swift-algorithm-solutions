import Foundation

let N = Int(readLine()!)!
solution(N)

func solution(_ testCaseN: Int) {
    
    for _ in 0..<testCaseN {
        let n = Int(readLine()!)!
        var dp: [Int] = [0, 1, 2, 4]
        
        if n <= 3 {
            print(dp[n])
            continue
        }
        
        dp += Array(repeating: -1, count: n-3)
        for i in 4...n {
            dp[i] = dp[i-1] + dp[i-2] + dp[i-3]
        }
        
        print(dp[n])
    }
}
