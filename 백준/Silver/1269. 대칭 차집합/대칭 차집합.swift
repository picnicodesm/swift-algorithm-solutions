let _ = readLine()!
let setA = Set(readLine()!.split(separator: " ").map { Int(String($0))! })
let setB = Set(readLine()!.split(separator: " ").map { Int(String($0))! })
let outputSet = setA.symmetricDifference(setB)

print(outputSet.count)