let n = Int(readLine()!)!
var arr: [Int] = []

for _ in 1...n {
    arr.append(Int(readLine()!)!)
}

// sort
for e in arr.sorted() {
    print(e)
}