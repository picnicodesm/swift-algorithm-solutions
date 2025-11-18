let N = Int(readLine()!)!
var points: [(Int, Int)] = []

for _ in 0..<N {
    let input = readLine()!.split(separator: " ").map { Int(String($0))! }
    points.append((input[0], input[1]))
}

var output = points.sorted { $0.1 == $1.1 ? $0.0 < $1.0 : $0.1 < $1.1 }

for (x, y) in output {
    print(x, y)
}
