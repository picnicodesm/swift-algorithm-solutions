import Foundation

func solution(_ left:Int, _ right:Int) -> Int {
    var result = 0
    
    for n in left...right {
        if getNumOfDivisor(n) % 2 == 0 {
            result += n
        } else {
            result -= n
        }
    }

    return result
}

func getNumOfDivisor(_ n: Int) -> Int {
    if n == 1 { return 1 }
    if n < 4 { return 2 }
    
    var count = 0
    let bound = Int(sqrt(Double(n)))
    for i in 1..<bound {
        if n % i == 0 {
            count += 2
        }
    }
    
    return bound*bound == n ? count + 1 : count
    
}