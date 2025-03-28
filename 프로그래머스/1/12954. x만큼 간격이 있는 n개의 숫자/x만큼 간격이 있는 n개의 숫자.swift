func solution(_ x:Int, _ n:Int) -> [Int64] {
    var output: [Int64] = []
    
    for i in 1...n {
        output.append(Int64(x * i))
    }
    
    return output
}