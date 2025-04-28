import Foundation

let N = Int(readLine()!)!
var dp = Array(repeating: 0, count: N)

for _ in 0..<N {
    let line = readLine()!.split(separator: " ").map { Int(String($0))! }
    let length = line.count
    
    var newDp = dp
    for index in 0..<dp.count {
        let leftIndex = index - 1
        let rightIndex = index
        
        if index < length {
            if leftIndex < 0 {
                newDp[index] += line[index]
            } else {
                newDp[index] = max(dp[leftIndex], dp[rightIndex]) + line[index]
            }
        } else {
            newDp[index] = newDp[index-1]
        }
    }
    dp = newDp
}

print(dp.max()!)