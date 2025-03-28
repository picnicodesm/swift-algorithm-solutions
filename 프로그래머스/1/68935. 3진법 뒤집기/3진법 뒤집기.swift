import Foundation

func solution(_ n:Int) -> Int {
    var n = n
    var reversed = ""
    var place = 1
    var output = 0

    while n != 0 {
        reversed += String(n % 3)
        n /= 3
    }
    
    for mul in reversed.reversed() {
        output += (Int(String(mul))! * place)
        place *= 3
    }
    
    return output
}