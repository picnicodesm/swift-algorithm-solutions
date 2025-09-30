import Foundation

func solution(_ spell:[String], _ dic:[String]) -> Int {
    
    for word in dic {
        var flag = true
        
        let wordSet = Set(word.map { String($0) })
        for c in spell {
            if !wordSet.contains(c) {
                flag = false
                break
            }
        }
        
        if flag { return 1 }
    }
    
    return 2
}