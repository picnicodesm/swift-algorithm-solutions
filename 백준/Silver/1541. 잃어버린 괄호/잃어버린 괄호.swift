import Foundation

let input = readLine()!

func solution(_ string: String) -> Int {
    var plus: Int = 0
    var minus: Int = 0
    var nums: [Character] = []
    var isSaveToMinus = false

    for c in input {
        if c == "-" || c == "+" {
            if isSaveToMinus {
                minus += Int(String(nums))!
                nums = []
            } else {
                plus += Int(String(nums))!
                nums = []
            }
            
            if c == "-" {
                isSaveToMinus = true
            }
            continue
        }
        
        nums.append(c)
    }
    
    if isSaveToMinus {
        minus += Int(String(nums))!
    } else {
        plus += Int(String(nums))!
    }

    return plus - minus
}

print(solution(input))