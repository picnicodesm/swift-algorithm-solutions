import Foundation

func solution(_ my_string:String, _ index_list:[Int]) -> String {
    var char: [Character] = []
    var result: [Character] = []
    
    let _ = my_string.map { 
        char.append($0)
    }
    
    for i in index_list {
        result.append(char[i])
    }
    
    return String(result)
}