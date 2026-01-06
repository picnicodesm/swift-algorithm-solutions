let numberOfTest = Int(readLine()!)!

for _ in 0..<numberOfTest {
    let inputString = readLine()!.split(separator: " ")
    let repeatTime = Int(inputString[0])!
    let string = inputString[1]
    var output = ""
    
    for c in string {
        output += Array(repeating: String(c), count: repeatTime).reduce("", +)
    }
    print(output)
}
