import Foundation

let n = readLine()!.components(separatedBy: [" "]).map { Int($0)! }
let (a, b) = (n[0], n[1])

let line = String(repeating: "*", count: a) + "\n"
let output = String(repeating: line, count: b)

print(output)