import Foundation

let n = Int(readLine()!)!
var points: [[Int]] = []

for _ in 0..<n {
    points.append(readLine()!.split(separator: " ").map { Int(String($0))! })
}

points = points.sorted {
    return $0[0] == $1[0] ? $0[1] < $1[1] : $0[0] < $1[0]
}

print(points.map { "\($0[0]) \($0[1])" }.joined(separator: "\n"))