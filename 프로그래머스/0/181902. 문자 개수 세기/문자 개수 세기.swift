import Foundation

func solution(_ my_string:String) -> [Int] {
    var lower: [Int] = Array(repeating: 0, count: 26)
    var upper: [Int] = Array(repeating: 0, count: 26)
    
    for c in my_string {
        if c.isUppercase {
            upper[Int(c.asciiValue!) - 65] += 1
        } else {
            lower[Int(c.asciiValue!) - 97] += 1
        }
    }
    
    return upper + lower
}