import Foundation

let N = Int(readLine()!)!
var nums: [Int] = []

for _ in 0..<N {
    nums.append(Int(readLine()!)!)
}

solution(N, nums: nums)


func solution(_ N: Int, nums: [Int]) {
    let sorted = nums.sorted()
    let avg = Int(round(Double(sorted.reduce(0, +)) / Double(N)))
    let centerValue = sorted[N/2]
    var maxAppearValue: Int {
        let values = getMaxAppearValues(nums: sorted)
        if values.count == 1 {
            return values.first!
        } else {
            return values[1]
        }
    }
    let range = sorted[N-1] - sorted[0]
    
    print(avg)
    print(centerValue)
    print(maxAppearValue)
    print(range)
}

func getMaxAppearValues(nums: [Int]) -> [Int] {
    var current = nums[0]
    var count = 1
    var maxCount = 1
    var results: [Int] = []
    let length = nums.count
    
    if length == 1 { return nums }
    for index in 1..<length {
        if nums[index] == current {
            count += 1
            if index == length - 1 {
                if count == maxCount {
                    results.append(current)
                } else if count > maxCount {
                    results = []
                    results.append(current)
                }
            }
        } else {
            if count == maxCount {
                results.append(nums[index-1])
            } else if count > maxCount {
                results = []
                results.append(nums[index-1])
                maxCount = count
            }
            current = nums[index]
            count = 1
            
            if index == length-1 {
                if maxCount == 1 {
                    results.append(current)
                }
            }
        }
    }
    return results
}