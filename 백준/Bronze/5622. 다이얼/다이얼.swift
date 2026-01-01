let dic: [Int: String] = [1: "", 2: "ABC", 3: "DEF", 4: "GHI", 5: "JKL", 6: "MNO", 7: "PQRS", 8: "TUV", 9: "WXYZ", 0: ""]
var output = 0

let input = readLine()!
for c in input {
    let time = dic.filter { $0.value.contains(c) }.first!.key + 1
    output += time
}

print(output)
