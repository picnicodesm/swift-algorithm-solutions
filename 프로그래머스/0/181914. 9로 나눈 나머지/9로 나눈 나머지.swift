import Foundation

func solution(_ number:String) -> Int {
    let num = number.map { Int(String($0))! }.reduce(0, +)
    return num % 9
}