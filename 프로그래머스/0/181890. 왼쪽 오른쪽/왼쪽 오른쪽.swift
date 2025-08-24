import Foundation

func solution(_ str_list:[String]) -> [String] {
    var result: [String] = []
    
    for (i, c) in str_list.enumerated() {
        if c == "l" {
            return Array(str_list[0..<i])
        } else if c == "r" {
            let startIndex = i+1
            if startIndex == str_list.count { return [] }
            else {
                return Array(str_list[startIndex...])
            }
        }
    }
    
    return result
}