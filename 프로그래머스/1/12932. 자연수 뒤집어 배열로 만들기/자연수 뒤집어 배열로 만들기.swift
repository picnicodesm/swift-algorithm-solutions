func solution(_ n:Int64) -> [Int] {
    var output: [Int] = []
    
    for i in String(n).map { Int(String($0))! }.reversed() {
        output.append(i)
    }
    
    return output
}