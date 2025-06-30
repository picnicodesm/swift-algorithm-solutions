import Foundation

func solution(_ a:Int, _ d:Int, _ included:[Bool]) -> Int {
    var currentN = a
    var result = 0
    
    for include in included {
        if include { result += currentN }
        currentN += d
    }
    
    return result
}