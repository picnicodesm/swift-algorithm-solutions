import Foundation

func solution(_ quiz:[String]) -> [String] {
    
    var result: [String] = []
    
    for str in quiz {
        let components = str.split(separator: " ").map { String($0) }
        let a = Int(components[0])!
        let b = Int(components[2])!
        let op = components[1]
        let c = Int(components[4])!
        
        if op == "+" {
            result.append(a + b == c ? "O": "X")
        } else {
            result.append(a - b == c ? "O" : "X")
        }
    }
    
    return result
}