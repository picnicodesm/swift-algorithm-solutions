func solution(_ arr:[Int], _ divisor:Int) -> [Int] {
    let output = arr.sorted().filter { $0 % divisor == 0 }
    
    return output.isEmpty ? [-1] : output
}