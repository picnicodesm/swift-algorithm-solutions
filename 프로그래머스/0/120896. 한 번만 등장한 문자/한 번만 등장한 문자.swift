import Foundation

func solution(_ s:String) -> String {
     var arr = Array(repeating: 0, count: 26)
    var result: [Character] = []
    
    for c in s {
        let i = Int(c.asciiValue! - 97)
        arr[i] += 1
    }
    
    for i in 0..<arr.count {
        if arr[i] == 1 {
            result.append(Character(UnicodeScalar(i+97)!))
        }
    }
    
    return String(result)
}