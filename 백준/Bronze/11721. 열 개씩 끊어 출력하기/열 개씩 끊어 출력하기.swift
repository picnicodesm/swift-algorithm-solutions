let input = readLine()!
var output: [Character] = []

for c in input {
    output.append(c)
    if output.count == 10 {
        print(String(output))
        output = []
    }
}
print(String(output))