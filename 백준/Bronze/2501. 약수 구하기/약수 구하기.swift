let input = readLine()!.split(separator: " ").map { Int(String($0))! }

var index = 1
var factor = 1

while true {
    if index > input[1] { break }
    if factor > input[0] {
        factor = 1
        break
    }
    
    if input[0] % factor == 0 {
        index += 1
    }
    factor += 1
}

print(factor - 1)