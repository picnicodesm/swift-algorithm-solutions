import Foundation

func solution(_ myString:String, _ pat:String) -> Int {
    var result = 0 
    let length = pat.count
    let myStr = Array(myString)
    
    for i in 0...myStr.count-length {
        let str = String(myStr[i..<i+length])
        if str == pat { result += 1 }
    }
    
    return result
}