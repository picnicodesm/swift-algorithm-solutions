let input = Int(readLine()!)!
var n = 1 // 생성자
while n < input {
    var temp = n
    var sum = 0
    while temp != 0 {
        sum += temp % 10
        temp /= 10
    }
    let newSum = n + sum // 분해합
    if input == newSum {
        break
    }
    n += 1
}
print(n == input ? 0 : n)