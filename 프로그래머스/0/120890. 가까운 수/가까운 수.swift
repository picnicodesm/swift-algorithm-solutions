import Foundation

func solution(_ array:[Int], _ n:Int) -> Int {
    var minDiff = Int.max
    var result = array.first!
    
    for num in array {
        let diff = abs(num - n)
        print("diff \(diff), minDiff: \(minDiff)")
        if diff == minDiff {
            result = min(num, result)
            minDiff = diff
        } else if diff < minDiff { 
            result = num
            minDiff = diff
        }
        
    }
    
    return result
}