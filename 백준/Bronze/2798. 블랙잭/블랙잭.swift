let input = readLine()!.split(separator: " ").map { Int(String($0))! }
let cards = readLine()!.split(separator: " ").map { Int(String($0))! }
var currentMax = 0

for index_i in 0..<cards.count-2 {
    let firstCard = cards[index_i]
    for index_j in index_i+1..<cards.count-1 {
        let secondCard = cards[index_j]
        for index_k in index_j+1..<cards.count {
            let thirdCard = cards[index_k]
            let sum = firstCard + secondCard + thirdCard
            
            if sum > currentMax && sum <= input[1] {
                currentMax = sum
            }
        }
    }
}

print(currentMax)