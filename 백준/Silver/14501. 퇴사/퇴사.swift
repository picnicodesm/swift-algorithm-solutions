import Foundation

let N = Int(readLine()!)!
var schedule: [[Int]] = []

for _ in 0..<N {
    let input = readLine()!.split(separator: " ").map { Int(String($0))! }
    schedule.append(input)
}

print(solution(schedule, N))

func solution(_ schedule: [[Int]], _ day: Int) -> Int {
    var time: [Int] = []
    var cost: [Int] = []
    var dp: [Int] = Array(repeating: 0, count: day)
    
    for counsel in schedule {
        time.append(counsel[0])
        cost.append(counsel[1])
    }
    
    for index in stride(from: day-1, through: 0, by: -1) {
        let nextIndex = index + time[index]
        if nextIndex > day {
            dp[index] = 0
        } else if nextIndex == day {
            dp[index] = cost[index]
        } else {
            dp[index] = cost[index] + dp[nextIndex...].max()!
        }
    }
    
    return dp.max()!
}