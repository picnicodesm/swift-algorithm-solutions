var input = readLine()!.split(separator: " ").map { Int(String($0))! }
let nOfBasket = input[0]
let nLoop = input[1]
var basketArr = Array(repeating: 0, count: nOfBasket)

for _ in 1...nLoop {
    let inputLine = readLine()!.split(separator: " ").map { Int(String($0))! }
    let i = inputLine[0], j = inputLine[1]
    
    for index in i-1...j-1 {
        basketArr[index] = inputLine[2]
    }
}

for e in basketArr {
    print(e, terminator: " ")
}