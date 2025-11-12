let input = readLine()!

let arr: [String] = input.map { String($0) }.sorted(by: >)
print(arr.reduce("", +))