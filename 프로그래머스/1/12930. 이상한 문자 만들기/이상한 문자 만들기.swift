import Foundation

func solution(_ s:String) -> String {
    let output = s.components(separatedBy: " ").map {
        let subString = $0.enumerated().map {
            $0.offset % 2 == 0 ? $0.element.uppercased() : $0.element.lowercased()
        }
        print(subString)
        return subString.joined()
    }.joined(separator: " ")
    
    return output
}