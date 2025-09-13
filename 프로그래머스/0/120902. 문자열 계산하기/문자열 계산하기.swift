import Foundation

func solution(_ my_string:String) -> Int {
    var components = my_string.split(separator: " ")
    var result = Int(components[0])!
    var op = " "
    
    for i in 1..<components.count {
        let component = components[i]
        
        if let n = Int(component) {
            if op == "+" { result += n }
            else { result -= n }
        } else {
            op = String(component)
        }
    }

    return result
}