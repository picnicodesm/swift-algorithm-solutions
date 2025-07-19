import Foundation

func solution(_ i:Int, _ j:Int, _ k:Int) -> Int {
    var result = 0
    
    for n in i...j {
        for c in String(n) {
            if String(c) == String(k) { result += 1 }
        }
    }
    
    return result
}