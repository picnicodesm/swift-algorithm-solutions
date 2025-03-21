var n = Int(readLine()!)!
var arr = readLine()!.split(separator: " ").map { Int(String($0))! }
var vToFind = Int(readLine()!)!
var count = 0

for e in arr {
    if vToFind == e {
        count += 1
    }
}

print(count)
