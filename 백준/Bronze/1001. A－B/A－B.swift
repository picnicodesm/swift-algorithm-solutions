let num = readLine()!.split(separator: " ").map { Int(String($0))! }
print("\(num[0] - num[1])")