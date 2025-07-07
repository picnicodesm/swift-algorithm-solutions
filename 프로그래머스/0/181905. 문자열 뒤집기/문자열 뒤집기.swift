import Foundation

func solution(_ my_string:String, _ s:Int, _ e:Int) -> String {
    let startIndex = my_string.index(my_string.startIndex, offsetBy: s)
    let endIndex = my_string.index(my_string.startIndex, offsetBy: e)
    let backStartIndex = my_string.index(after: endIndex)
    let front = my_string[my_string.startIndex..<startIndex]
    let back = my_string[backStartIndex...]
    let reverse = String(my_string[startIndex...endIndex].reversed())
    let result = String(front + reverse + back)
    
    return result
}