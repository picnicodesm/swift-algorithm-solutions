import Foundation

func solution(_ number:Int, _ limit:Int, _ power:Int) -> Int {
    var result = 0
    
    for n in 1...number {
        let grade = numOfDivisor(n)
        if grade > limit {
            result += power
        } else {
            result += grade
        }
    }
    
    return result
}

func numOfDivisor(_ n: Int) -> Int {
    if n == 1 { return 1 }
    if n < 4 { return 2 }
    var count = 0
    let root = Int(sqrt(Double(n)))
    
    for num in 1...root {
        if n % num == 0 {
            count += 2
        }
    }
    
    return root * root == n ? count-1 : count
}

 