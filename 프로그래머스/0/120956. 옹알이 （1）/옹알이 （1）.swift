import Foundation

func solution(_ babbling:[String]) -> Int {
    let words = ["aya", "ye", "woo", "ma"]
    var isChange = false
    var babbling: [String] = babbling
    
    babbling = babbling.map { 
        var s = $0
        for word in words {
            s = s.replacingOccurrences(of: word, with: " ")
        }
        return s
    }
    
    
    return babbling.filter { $0.replacingOccurrences(of: " ", with: "") == "" }.count
}