let receipt = Int(readLine()!)!
let numberOfProductKind = Int(readLine()!)!
var sum = 0
for _ in 0..<numberOfProductKind {
    let input = readLine()!.split(separator: " ").map { Int(String($0))! }
    let price = input[0]
    let numberOfProduct = input[1]
    sum += (price * numberOfProduct)
}
if receipt == sum {
    print("Yes")
} else {
    print("No")
}