import Foundation

let input = readLine()!.split(separator: " ").map { Int(String($0))! }
let string = Array(readLine()!).map { String($0) }
let forSuccess = readLine()!.split(separator: " ").map { Int(String($0))! }

solution()

func solution() {
    var result = 0
    let acgt = ["A": forSuccess[0], "C": forSuccess[1], "G": forSuccess[2], "T": forSuccess[3]]
    var currentAcgt = ["A": 0, "C": 0, "G": 0, "T": 0]

    for index in 0..<input[1] {
        currentAcgt[string[index]]! += 1
    }
    if canBeUsed(currentAcgt, acgt) { result += 1 }

    for index in input[1]..<input[0] {
        currentAcgt[string[index]]! += 1
        currentAcgt[string[index-input[1]]]! -= 1
        if canBeUsed(currentAcgt, acgt) { result += 1 }
    }
    
    print(result)
}

func canBeUsed(_ test: [String: Int], _ answer: [String: Int]) -> Bool {
    if test["A"]! >= answer["A"]! &&
        test["C"]! >= answer["C"]! &&
        test["G"]! >= answer["G"]! &&
        test["T"]! >= answer["T"]! {
        return true
    }
    return false
}