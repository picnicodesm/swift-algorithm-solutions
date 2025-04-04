import Foundation

let N = Int(readLine()!)!
let A = readLine()!.split(separator: " ").map { Int(String($0))! }
let B = readLine()!.split(separator: " ").map { Int(String($0))! }

let result = zip(A.sorted(), B.sorted(by: >)).map { $0 * $1 }.reduce(0, +)
print(result)
