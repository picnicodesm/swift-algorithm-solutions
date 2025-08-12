import Foundation

func solution(_ q:Int, _ r:Int, _ code:String) -> String {
    var result: [Character] = []
    
    for (i, c) in code.enumerated() {
        if i % q == r { result.append(c) }
    }
    
    return String(result)
}