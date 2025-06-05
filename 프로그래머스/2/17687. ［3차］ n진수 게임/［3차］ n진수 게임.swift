func solution(_ n:Int, _ t:Int, _ m:Int, _ p:Int) -> String {
    var nums = ""
    var chars: [Character] = []
    var result = ""
    
    for i in 0...t*m {
        let num = String(i, radix: n)
        nums += num.uppercased()
    }
    
    chars = Array(nums)
    
    for i in stride(from: p-1, to: t*m, by: m) {
        result += String(chars[i])
    }
    
    return result
}