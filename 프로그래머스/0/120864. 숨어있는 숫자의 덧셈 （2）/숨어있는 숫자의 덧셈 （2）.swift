import Foundation

func solution(_ my_string:String) -> Int {
    return my_string.components(separatedBy: CharacterSet.letters).filter { $0 != "" }.map { Int(String($0))! }.reduce(0,+)
}