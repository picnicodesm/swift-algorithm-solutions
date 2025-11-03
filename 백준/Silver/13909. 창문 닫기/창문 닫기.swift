import Foundation

var count = 0
let input = Int(readLine()!)!

for i in 1...Int(sqrt(Double(input))) {
    if i*i <= input {
        count += 1
    }
}

print(count)