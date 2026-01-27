import Foundation

let n = Int(readLine()!)!
var points: [(Int, Int)] = []

for _ in 0..<n {
    let input = readLine()!.split(separator: " ").map { Int(String($0))! }
    points.append((input[0], input[1]))
}

points = points.sorted {
    return $0.0 == $1.0 ? $0.1 < $1.1 : $0.0 < $1.0
}

print(points.map { "\($0) \($1)" }.joined(separator: "\n"))