import Foundation

func solution(_ age:Int) -> String {
    var result: String = ""
    
    for n in String(age) {
        let n = Int(String(n))!
        result += String(UnicodeScalar(97+n)!)
    }
    
    return result
}