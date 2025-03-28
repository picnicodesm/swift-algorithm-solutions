import Foundation

func solution(_ s:String) -> Int {
    // Int로 바꿀 수 있으면 그대로 바꿔서 보내고
    // 바꿀 수 없다는 것은 문자열이 있다는 것.
    let words = ["zero", "one", "two", "three", "four", "five", "six", "seven", "eight", "nine"]
    
    if var s = Int(s) {
        return s
    } else {
        var result = s
        
        for i in 0...9 {
            result = result.replacingOccurrences(of: words[i], with: String(i))
        }
        
        return Int(result)!
    }
}