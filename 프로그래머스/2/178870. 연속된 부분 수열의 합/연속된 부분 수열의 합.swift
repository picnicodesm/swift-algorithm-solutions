import Foundation

func solution(_ sequence:[Int], _ k:Int) -> [Int] {
    // 투 포인터를 이용해야할 것 같아요.
    // 합이 k가 되는 것을 먼저 찾아야 할 것 같아요.
    // 그러면 어떻게 합이 k인걸 찾을 수 있을까?
    // 오름차순이기 때문에 무조건 뒤의 숫자가 크다.
    // 뒤 포인터를 늘려 가면서 값을 비교한다.
    // 합이 k를 넘어가면 앞 포인터를 당긴다.
    // 앞 포인터가 뒷 포인터를 넘어가면 찾을 수 없는 k이다.
    // 길이도 비교해야 한다.
    
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