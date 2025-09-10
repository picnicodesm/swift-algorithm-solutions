import Foundation

func solution(_ k:Int, _ d:Int) -> Int64 {
    var ans = 0
    
    for x in stride(from: 0, to: d + 1, by: k) {
        let y = Int(sqrt(Double(d * d - x * x)))
        ans += y / k + 1
    }
    
    return Int64(ans)
}