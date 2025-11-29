let input = readLine()!.split(separator: " ").map { Int(String($0))! }
// 0: numberOfBasket, 1: numberOfAct

var basket = Array(1...input[0])

for _ in 1...input[1] {
    let index = readLine()!.split(separator: " ").map { Int(String($0))! - 1 }
    // 0: startIndex, 1: endIndex
    let replacingRange = index[0]...index[1]
    let reversedBasket = basket[replacingRange].reversed()
    basket.replaceSubrange(replacingRange, with: reversedBasket)
}

for e in basket {
    print(e, terminator: " ")
}
