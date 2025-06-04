import Foundation

func solution(_ word:String) -> Int {
    var stack: [Character] = ["U", "O", "I", "E", "A"]
    var result = 0
    var find = false
    
    func dfs(_ currentWord: String) {
        if find { return }
        let c = stack.removeLast()
        let currentWord = currentWord + String(c)
        result += 1
        
        if currentWord == word { 
            find = true

            return 
        }
        if currentWord.count == 5 { return }
        else {
            stack.append("U")
            stack.append("O")
            stack.append("I")
            stack.append("E")
            stack.append("A")
        
            dfs(currentWord)
            dfs(currentWord)
            dfs(currentWord)
            dfs(currentWord)
            dfs(currentWord)
        }
    }

    dfs("")
    dfs("")
    dfs("")
    dfs("")
    dfs("")

    return result
}