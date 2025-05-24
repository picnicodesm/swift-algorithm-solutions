import Foundation

func solution(_ citations:[Int]) -> Int {
    var result = 0
    var flag = false
    
    while true {
        var high: [Int] = []
        var low: [Int] = []
        for n in citations { 
            if n >= result { high.append(n) }
            else { low.append(n) }
        }
        
        if high.count >= result && low.count <= result { 
            flag = true
            result += 1
        } else {
            if flag { return result-1 }
            else { result += 1}
        }
    }
}