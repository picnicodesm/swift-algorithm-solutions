import Foundation

let input = readLine()!.split(separator: " ").map { Int(String($0))! }
let dolls = readLine()!.split(separator: " ").map { Int(String($0))! }

solution(input[0], input[1], dolls)

func solution(_ count: Int, _ k: Int, _ dolls: [Int]) {
    var lianIndices: [Int] = []
    var frontPointer = 0
    var lianCount = 0
    var result = count + 1
    
    for (index, doll) in dolls.enumerated() {
        if doll == 1 {
            lianIndices.append(index)
            lianCount += 1
            
            if lianCount >= k {
                if lianCount > k { frontPointer += 1 }
                let size = lianIndices.last! - lianIndices[frontPointer] + 1
                if result > size { result = size }
            }
        }
    }
    
    if result == count + 1 { print(-1) }
    else { print(result) }
}