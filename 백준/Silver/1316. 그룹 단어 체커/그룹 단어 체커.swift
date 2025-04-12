let C = Int(readLine()!)!
var numOfGroupWord = C
for _ in 1...C {
    var arr = [Character]()
    let word = readLine()!
    for c in word {
        if c != arr.last && arr.contains(c) {
            numOfGroupWord -= 1
            break
        } else {
            arr.append(c)
        }
        
    }
   
}

print(numOfGroupWord)