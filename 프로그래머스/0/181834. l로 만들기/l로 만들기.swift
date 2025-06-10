import Foundation

func solution(_ myString:String) -> String {
    
    var result: [Character] = Array(myString).map { 
        return $0 < "l" ? "l" : $0
    }
    
    return String(result)
}