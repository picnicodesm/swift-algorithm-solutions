func solution(_ arr:[Int]) -> Int {
    var result = 0
    
    func gcd(_ a: Int, _ b: Int) -> Int {
        if b == 0 { return a }
        return gcd(b, a%b)
    }
    
    func lcm(_ a: Int, _ b: Int) -> Int {
        return (a*b) / gcd(a, b)
    }
    
    result = arr.reduce(1) { lcm($0,$1) }
    
    return result
}