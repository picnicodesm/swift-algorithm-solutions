import Foundation

var output = ""

while let input = readLine() {
    if input == "" {
        output += "\n"
        continue
    }
    output += (input + "\n")
}

print(output)
