import Foundation

let _ = readLine()!
let times = readLine()!.split(separator: " ").map { Int(String($0))! }

var result = 0
var timeSum = 0
for time in times.sorted() {
    timeSum += time
    result += timeSum
}

print(result)