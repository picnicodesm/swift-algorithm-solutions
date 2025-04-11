import Foundation

let input = readLine()!.split(separator: " ").map { Int(String($0))! }
let arr = readLine()!.split(separator: " ").map { Int(String($0))! }

solution(input[0], input[1], arr)

func solution(_ N: Int, _ K: Int, _ arr: [Int]) {
    var subSum = arr[0..<K].reduce(0,+)
    var result = subSum
    
    for index in K..<N {
        subSum += arr[index] - arr[index-K]
        if subSum > result { result = subSum }
    }
    
    print(result)
}