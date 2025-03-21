let input = readLine()!.split(separator: " ").map { Int(String($0))! }
let arr = readLine()!.split(separator: " ").map { Int(String($0))! }
for n in arr {
    if n < input[1] {
        print(n, terminator: " ")
    }
}