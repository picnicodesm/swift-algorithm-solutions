func solution(_ n:Int) -> String {
    var output = String(repeating: "수박", count: n/2)
    
    return n % 2 == 0 ? output : output + "수"
}