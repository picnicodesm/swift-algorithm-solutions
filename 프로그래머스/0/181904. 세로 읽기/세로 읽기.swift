import Foundation

func solution(_ my_string:String, _ m:Int, _ c:Int) -> String {
    let str: [Character] = Array(my_string)
    var index = c - 1
    var result = ""
    
    while index < str.count {
        result += String(str[index])
        index += m
    }
    
    return result
}