let inputString = readLine()!
let alphabet = "abcdefghijklmnopqrstuvwxyz"
var output = ""

for e in alphabet {
    if let firstIndex = inputString.firstIndex(of: e) {
        output += "\(firstIndex.utf16Offset(in: inputString)) "
    } else {
        output += "-1 "
    }
}

print(output)