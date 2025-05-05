import Foundation

func solution(_ my_strings:[String], _ parts:[[Int]]) -> String {
    var result: [String] = my_strings.enumerated().map {
        let startIndex = $0.element.index($0.element.startIndex, offsetBy: parts[$0.offset][0])
        let lastIndex = $0.element.index($0.element.startIndex, offsetBy: parts[$0.offset][1])
        
        return String($0.element[startIndex...lastIndex])
    }

    return result.joined()
}