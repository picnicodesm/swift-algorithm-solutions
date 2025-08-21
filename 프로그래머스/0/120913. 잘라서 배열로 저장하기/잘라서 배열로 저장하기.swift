import Foundation

func solution(_ my_str:String, _ n:Int) -> [String] {
    var result: [String] = []
    var temp: [Character] = []
    var count = 0
    
    for c in my_str {
        temp.append(c)
        count += 1 
        
        if count == n  { 
            result.append(String(temp))
            temp = []
            count = 0
        }
    }
    
    if !temp.isEmpty { result.append(String(temp)) }
    
    return result
}