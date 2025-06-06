import Foundation

func solution(_ n:Int, _ k:Int) -> Int {
   
    let converted = String(n, radix: k)
    let nums = converted.split(separator: "0").map { Int(String($0))! }
    var result = 0
    
    for num in nums {
        if isPrime(num) { result += 1}
    }
    
    return result
}

func isPrime(_ n: Int) -> Bool {
    if n == 1 { return false }
    if n <= 3 { return true }
    
    for i in 2...Int(sqrt(Double(n))) {
        if n % i == 0 { return false }
    }
    
    return true
}