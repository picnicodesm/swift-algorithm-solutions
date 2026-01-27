import Foundation

let n = Int(readLine()!)!
var info: [(age: Int, name: String, regiOrder: Int)] = []

for order in 0..<n {
    let input = readLine()!.split(separator: " ").map { String($0) }
    info.append((age: Int(input[0])!, name: input[1], regiOrder: order))
}

info = info.sorted {
    return $0.age == $1.age ? $0.regiOrder < $1.regiOrder : $0.age < $1.age
}

print(info.map { "\($0.age) \($0.name)" }.joined(separator: "\n"))