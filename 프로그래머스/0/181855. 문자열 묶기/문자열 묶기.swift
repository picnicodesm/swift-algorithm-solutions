import Foundation

func solution(_ strArr:[String]) -> Int {
    var groups = Array(repeating: 0, count: 31)
    
    for str in strArr {
        groups[str.count] += 1
    }
    
    return groups.max()!
}