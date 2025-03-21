let _ = readLine()
let inputs = readLine()!.split(separator: " ").map { Int(String($0))! }

print(inputs.min()!, inputs.max()!)
