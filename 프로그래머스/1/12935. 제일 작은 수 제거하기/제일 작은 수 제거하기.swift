func solution(_ arr:[Int]) -> [Int] {
    let min = arr.min()!
    var output = arr.filter { $0 != min }
    
    return output.isEmpty ? [-1] : output
}