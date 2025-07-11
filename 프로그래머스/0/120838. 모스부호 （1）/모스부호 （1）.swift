import Foundation

func solution(_ letter:String) -> String {
    let morse: [String: String] = [
        ".-": "a", "-...": "b", "-.-.": "c", "-..": "d", ".": "e",
        "..-.": "f", "--.": "g", "....": "h", "..": "i", ".---": "j",
        "-.-": "k", ".-..": "l", "--": "m", "-.": "n", "---": "o", ".--.": "p",
        "--.-": "q", ".-.": "r", "...": "s" , "-": "t" , "..-": "u", "...-": "v",
        ".--": "w", "-..-": "x", "-.--": "y", "--..": "z"
    ]
    
    var result = ""
    
    let codes = letter.split(separator: " ").map { String($0) }
    for code in codes {
        result += morse[code]!
    }
    
    return result
}