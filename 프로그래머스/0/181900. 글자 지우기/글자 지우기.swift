import Foundation

func solution(_ my_string:String, _ indices:[Int]) -> String {
    var result: [Character] = Array(my_string)
    
    for i in indices {
        result[i] = "!"
    }
    
    return String(result.filter { $0 != "!"})
}