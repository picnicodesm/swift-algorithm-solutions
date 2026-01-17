let _ = Int(readLine()!)!
let numbers = readLine()!.split(separator: " ").map { Int(String($0))! }
var result = 0

for number in numbers {
    var isPrime = true
    
    if number == 1 { continue }
    
    for divider in 1...number/2 {
        if divider != 1 && divider != number && number % divider == 0 {
            isPrime = false
            break
        }
    }
    
    if isPrime {
        result += 1
    }
}

print(result)