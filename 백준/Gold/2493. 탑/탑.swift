import Foundation

var stack: [(height: Int, index: Int)] = []
var result: [Int] = []

let N = Int(readLine()!)!
let input = readLine()!.split(separator: " ").map { Int(String($0))! }

for index in 0..<input.count {
    
    let towerHeight = input[index]
    
    while !stack.isEmpty && stack.last!.height <= towerHeight {
        let _ = stack.popLast()!
    }
    
    if let recieved = stack.last {
        result.append(recieved.index+1)
    } else {
        result.append(0)
    }
    
    stack.append((height: input[index], index: index))
}

print(result.map { String($0) }.joined(separator: " "))