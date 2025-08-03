import Foundation

func solution(_ array:[Int]) -> Int {
    var result = 0
    
    for n in array {
        result += Array(String(n)).filter { $0 == "7" }.count
    }
    
    return result
}