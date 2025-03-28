import Foundation

func solution(_ s:String) -> Int {
    var result = 0
    var startCharacter: Character = s[s.startIndex]
    var numberOfStartCharacter = 0
    var numberOfOtherCharacter = 0
    
    for c in s {
        if (numberOfStartCharacter != 0 && numberOfOtherCharacter != 0) && 
            (numberOfStartCharacter == numberOfOtherCharacter) { 
            result += 1
            startCharacter = c
            numberOfStartCharacter = 0
            numberOfOtherCharacter = 0
        }
        
        if c == startCharacter {
            numberOfStartCharacter += 1
        } else {
            numberOfOtherCharacter += 1
        }        
    }
    
    return result + 1
}