import Foundation

func solution(_ picture:[String], _ k:Int) -> [String] {
    var result: [String] = []
    
    for line in picture {
        var newLine = ""
        
        for c in line {
            for _ in 0..<k {
                newLine += String(c)
            }
        }
        
        for _ in 0..<k {
            result.append(newLine)
        }
    }
    
    return result
}