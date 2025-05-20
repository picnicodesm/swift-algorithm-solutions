import Foundation

func solution(_ n:Int, _ words:[String]) -> [Int] {
    var usedWord = Set<String>()
    var lastWord = words[0]
    usedWord.insert(words[0]) 
    
    for (index, word) in words.enumerated() {
        if index == 0 { continue }
        if usedWord.contains(word) || word.first! != lastWord.last! { return [index%n+1, index/n+1] }
        else {
            usedWord.insert(word)           
            lastWord = word
        }
    }
    
    return [0,0]
}