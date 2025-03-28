import Foundation

func solution(_ s:String) -> [Int] {
    var indices = Array(repeating: -1, count: 26)
    var result: [Int] = []
    
    for (index, char) in s.enumerated() {
        let indexOfCharacterInArray = Int(char.asciiValue!) - 97
        let lastIndexOfCharacter = indices[indexOfCharacterInArray]
        
        if lastIndexOfCharacter == -1 {
            result.append(lastIndexOfCharacter)
        } else {
            result.append(index-lastIndexOfCharacter)
        }
        
        indices[indexOfCharacterInArray] = index
    }    
    
    return result
}