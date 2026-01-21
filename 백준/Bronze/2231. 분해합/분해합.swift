import Foundation

func getDecompositionSum(_ n: Int) -> Int {
    let nums = String(n).map { Int(String($0))! }
    let sum = n + nums.reduce(0,+)
    
    return sum
}

let n = readLine()!
let num = Int(n)!
let startNum = max(0,Int(n)! - (9 * n.count))
var output = 0

for i in startNum...num {
    let sum = getDecompositionSum(i)
    if sum == num {
        output = i
        break
    }
}

print(output)