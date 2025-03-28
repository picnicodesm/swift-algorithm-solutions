func solution(_ x:Int) -> Bool {
    let divider = String(x).map { Int(String($0))! }.reduce(0, +)
    
    return x % divider == 0 ? true : false
}


