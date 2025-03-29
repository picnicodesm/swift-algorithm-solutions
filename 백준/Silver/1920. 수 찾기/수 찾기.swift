import Foundation

let N  = Int(readLine()!)!
let set = Set(readLine()!.split(separator: " ").map { Int(String($0))! })
let M = Int(readLine()!)!
let input = readLine()!.split(separator: " ").map { Int(String($0))! }

for n in input {
    if set.contains(n) {
        print(1)
    } else {
        print(0)
    }
}