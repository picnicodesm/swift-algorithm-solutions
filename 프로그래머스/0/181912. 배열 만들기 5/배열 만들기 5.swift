import Foundation

func solution(_ intStrs:[String], _ k:Int, _ s:Int, _ l:Int) -> [Int] {
    var result: [Int] = []
    
    for intStr in intStrs {
        let frontIndex = intStr.index(intStr.startIndex, offsetBy: s)
        let backIndex = intStr.index(frontIndex, offsetBy: l-1)
        let num = Int(intStr[frontIndex...backIndex])!
        if num > k { result.append(num) }
    }
    
    return result
}