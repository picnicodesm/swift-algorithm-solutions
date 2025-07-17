import Foundation

func solution(_ sequence:[Int], _ k:Int) -> [Int] {    
    var p1 = 0
    var p2 = 0
    var result: [Int] = [0, sequence.count-1]
    var length: Int { result.last! - result.first! + 1 }
    var sum = sequence[0]
    
    while p1 <= p2 {        
        if sum < k {
            if p2 + 1 == sequence.count { 
                sum -= sequence[p1]
                p1 += 1
                continue
            }
            p2 += 1
            sum += sequence[p2]
        } else if sum > k {
            sum -= sequence[p1]
            p1 += 1
        } else { 
            let currentLength = p2 - p1 + 1
            if currentLength == length {
                if p1 < result[0] { 
                    result = [p1, p2]
                }
            } else if currentLength < length {
                result = [p1, p2]
            }
            
            sum -= sequence[p1]
            p1 += 1
        }
    }
    
    return result
}