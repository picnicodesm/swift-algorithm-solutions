import Foundation

func solution(_ n:Int) -> Int {
    if n == 0 { return 0 }
    var nums: [Int] = []
    
    for i in 1...n {
        if n % i == 0 {
            nums.append(i)
        }
    }
    
    return nums.reduce(0, +)
}