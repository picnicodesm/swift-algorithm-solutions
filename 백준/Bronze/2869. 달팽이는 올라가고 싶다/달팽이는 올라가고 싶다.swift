let input = readLine()!.split(separator: " ").map { Int(String($0))! }
let up = input[0]
let down = input[1]
var height = input[2]

if ((height - down) % (up - down)) != 0 {
    print((height-down) / (up - down) + 1)
} else {
    print((height-down) / (up - down))
}