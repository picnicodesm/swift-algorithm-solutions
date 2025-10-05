import Foundation

let s1 = readLine()!

var result: [String] = []

for c in s1 {
    if c.isUppercase {
        result.append(c.lowercased())
    } else {
        result.append(c.uppercased())
    }
}

print(result.joined())