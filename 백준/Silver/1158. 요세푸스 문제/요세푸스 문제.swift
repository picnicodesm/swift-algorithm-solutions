import Foundation

var NK = readLine()!.split(separator: " ").map { Int(String($0))! }

var table = Array(1...NK[0])
var result: [Int] = []
var index = 0

for _ in 0..<NK[0] {
    index = (index + NK[1] - 1) % table.count
    
    let removed = table.remove(at: index)
    result.append(removed)
}

print("<\(result.map { String($0) }.joined(separator: ", "))>")
