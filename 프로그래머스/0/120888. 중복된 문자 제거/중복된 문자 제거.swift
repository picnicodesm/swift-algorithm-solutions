import Foundation

func solution(_ my_string:String) -> String {
    var arr: [Character] = Array(my_string)
    var result: [Character] = []
    var usedChar: Set<Character> = []
    
    for c in arr {
        if !usedChar.contains(c) {
            result.append(c)
            usedChar.insert(c)
        }
    }
    
    return String(result)
}