import Foundation

func solution(_ diffs:[Int], _ times:[Int], _ limit:Int64) -> Int {
    var start = 1
    var end = diffs.max()!
    var mid = 0
    
    func canSolve(level: Int) -> Bool {
        var total = Int64(times[0])
        
        for i in 1..<diffs.count {
            let retry = diffs[i] - level
            let usedTime = retry > 0 ? (times[i-1] + times[i]) * retry + times[i] : times[i]
            total += Int64(usedTime)
            
            if total > limit { return false }
        }
        
        return true
    }
    
    while start <= end {
        mid = (start + end) / 2
        
       if canSolve(level: mid) { 
           end = mid - 1
       }  else {
           start = mid + 1
       }
    }
    
    if canSolve(level: mid) { return mid }
    else if canSolve(level: mid + 1) { return mid + 1 }
    else { return mid - 1 }    
}   




