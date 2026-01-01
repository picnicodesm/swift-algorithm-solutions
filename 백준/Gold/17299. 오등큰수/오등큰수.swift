import Foundation

let size = Int(readLine()!)!
let inputArr = readLine()!.split(separator: " ").map { Int(String($0))! }

var fAi: [Int: Int] = [:]
var result = Array(repeating: -1, count: size)
var stack: [Int] = []

for n in inputArr {
    fAi[n, default: 0] += 1
}

for i in 0..<size {
    let f = fAi[inputArr[i]]!
    while let j = stack.last, fAi[inputArr[j]]! < f {
        result[j] = inputArr[i]
        stack.removeLast()
    }
    stack.append(i)
}

print(result.map{ String($0) }.joined(separator: " "))
