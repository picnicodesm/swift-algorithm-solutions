import Foundation

func solution(_ myString:String, _ pat:String) -> Int {
    let converted = String(myString.map { return $0 == "A" ? "B" : "A" })
    
    return converted.contains(pat) ? 1 : 0
}