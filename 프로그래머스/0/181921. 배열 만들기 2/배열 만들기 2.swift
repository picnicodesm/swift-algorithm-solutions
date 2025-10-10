import Foundation

func solution(_ l:Int, _ r:Int) -> [Int] {
    var result: [Int] = []
    
    for n in l...r {
        if String(n).replacingOccurrences(of: "5", with: "").replacingOccurrences(of: "0", with: "").isEmpty {
            result.append(n)
        }
    }
    
    return result.isEmpty ? [-1] : result
}