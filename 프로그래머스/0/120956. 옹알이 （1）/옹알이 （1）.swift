import Foundation

func solution(_ babbling:[String]) -> Int {
    let words = ["aya", "ye", "woo", "ma"]
    var babbling: [String] = babbling
    
    babbling = babbling.filter {
        var s = $0
        for word in words {
            s = s.replacingOccurrences(of: word, with: "!")
        }
        return s.replacingOccurrences(of: "!", with: "").isEmpty
    }
    
    return babbling.count
}