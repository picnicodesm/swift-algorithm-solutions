import Foundation

func search(_ string: String) -> Int {
    var stringArr: [Character] = []
    var reversedStringArr: [Character] = []
    
    _ = zip(string, string.reversed()).map {
        stringArr.append($0)
        reversedStringArr.append($1)
    }
    
    for index in 0...string.count/2 {
        result += 1
        if stringArr[index] != reversedStringArr[index] { return 0 }
    }
    
    return 1
}

func isPalindrom(string: String) -> Int {
    return search(string)
}

let N = Int(readLine()!)!
var result = 0

for _ in 0..<N {
    result = 0
    let inputString = readLine()!
    print(isPalindrom(string: inputString), result)
}