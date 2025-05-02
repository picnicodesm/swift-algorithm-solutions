import Foundation

func solution(_ s:String) -> String {
    var words = s.components(separatedBy: " ")
    
    words = words.map { convert($0) }
    return words.joined(separator: " ")
}

func convert(_ word: String) -> String {
    if word == "" { return word }

    var result: String = word.first!.uppercased()
    let startIndex = word.index(word.startIndex, offsetBy: 1)
    let lastIndex = word.endIndex
    
    result += word[startIndex..<lastIndex].lowercased()
    return result
}