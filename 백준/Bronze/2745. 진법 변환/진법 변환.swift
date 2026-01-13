import Foundation

let input = readLine()!.split(separator: " ").map { String($0) }
let (N, B) = (input[0], Int(input[1])!)

let output = Int(N, radix: B)!
print(output)
