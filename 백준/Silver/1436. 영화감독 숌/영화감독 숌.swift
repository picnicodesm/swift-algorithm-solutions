import Foundation

let n = Int(readLine()!)!
var num = 666
var series = 0

while true {
    if isContainsTripleSix(in: num) {
        series += 1
    }
    
    if series == n {
        break
    } else {
        num += 1
    }
}

print(num)

func isContainsTripleSix(in num: Int) -> Bool {
    var num = num
    
    while num > 100 {
        if num % 1000 == 666 {
            return true
        } else {
            num /= 10
        }
    }
    
    return false
}