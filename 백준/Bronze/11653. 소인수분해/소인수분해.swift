import Foundation

var N = Int(readLine()!)!
var divisor = 2
var output = ""
var isFirst = true

if N != 1 {
    while divisor <= N {
        if N % divisor == 0 {
            if !isFirst {
                output += "\n\(divisor)"
            } else {
                output += "\(divisor)"
                isFirst = false
            }
            N /= divisor
        } else {
            divisor += 1
        }
    }
    
    print(output)
}