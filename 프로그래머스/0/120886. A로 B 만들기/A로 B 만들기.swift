import Foundation

func solution(_ before:String, _ after:String) -> Int {
    var alphabet = Array(repeating: 0, count: 26)
    
    for c in before {
        let ascii = Int(c.asciiValue!) - 97
        alphabet[ascii] += 1
    }
    
    for c in after {
        let ascii = Int(c.asciiValue!) - 97
        if alphabet[ascii] == 0 { return 0 }
        else { alphabet[ascii] -= 1 }
    }
    
    return 1
}