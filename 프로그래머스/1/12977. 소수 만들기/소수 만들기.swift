import Foundation

func solution(_ nums:[Int]) -> Int {
    var result = 0

    
    for index1 in 0..<nums.count-2 {
        for index2 in index1+1..<nums.count-1 {
            for index3 in index2+1..<nums.count {
                if isPrime(nums[index1] + nums[index2] + nums[index3]) {
                    result += 1
                }
            }
        }
    }

    return result
}

func isPrime(_ n: Int) -> Bool {
    if n <= 1 { return false }
    
    for i in 2...Int(sqrt(Double(n))) {
        if n % i == 0 {
            return false
        }
    } 
    
    return true
}