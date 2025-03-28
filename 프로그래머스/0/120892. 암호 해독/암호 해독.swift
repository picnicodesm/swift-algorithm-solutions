import Foundation

func solution(_ cipher:String, _ code:Int) -> String {
    var result = ""
    let cipherArr = Array(cipher)
    
    
    
    return String(cipher.enumerated().compactMap { ($0.offset + 1) % code == 0 ? $0.element : nil })
}