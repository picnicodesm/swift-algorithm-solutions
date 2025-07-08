import Foundation

func solution(_ myString:String, _ pat:String) -> String {
    let reversedStr = String(myString.reversed())
    let reversedRange = reversedStr.range(of: String(pat.reversed()))!
    let result = String(reversedStr[reversedRange.lowerBound...].reversed())
    
    return result
}