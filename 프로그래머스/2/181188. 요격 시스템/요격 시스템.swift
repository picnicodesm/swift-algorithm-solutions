import Foundation

func solution(_ targets:[[Int]]) -> Int {
    
    var result = 0 
    var lastRange = 0
    var targets = targets.sorted(by: {
        if $0[1] == $1[1] {
            return $0[0] <= $0[1]
        } else {
            return $0[1] < $1[1]
        }
    })
    
    for target in targets {
        if target[0] >= lastRange {
            result += 1
            lastRange = target[1]
        }
    }
    
    return result
}
