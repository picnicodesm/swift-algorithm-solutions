import Foundation

let N = Int(readLine()!)!
var weight: [Int] = []

for _ in 0..<N {
    let input = Int(readLine()!)!
    weight.append(input)
}

print(solution(N, weight))

func solution(_ n: Int, _ weight: [Int]) -> Int {
    let sortedWeight = weight.sorted(by: >)
    var result = sortedWeight[0]
    
    for index in 1..<n {
        result = max(result, sortedWeight[index] * (index+1))
    }
    
    return result
}