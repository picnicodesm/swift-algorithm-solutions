import Foundation

func solution(_ keymap:[String], _ targets:[String]) -> [Int] {
    
    var result: [Int] = Array(repeating: 0, count: targets.count)
    
    for (index, target) in targets.enumerated() {        
        for c in target {
            var minCount = 101
            for key in keymap {
                if let firstIndex = Array(key).firstIndex(of: c) {

                    minCount = min(Int(firstIndex)+1, minCount)
                }
            }
            print("character \(c)'s minCount: \(minCount)")
            if minCount >= 101 {
                result[index] = -1
                break
            } else {
                result[index] += minCount
            }
        }
    }
    
    
    return result
}