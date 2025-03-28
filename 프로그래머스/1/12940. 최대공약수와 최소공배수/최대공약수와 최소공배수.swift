import Foundation 

func solution(_ n:Int, _ m:Int) -> [Int] {
    return [gcd(n, m), lcm(n, m)]
}

func gcd(_ n: Int, _ m: Int) -> Int {
    return m == 0 ? n : gcd(m, n % m)
}

func lcm(_ n: Int, _ m: Int) -> Int {
    return n*m / gcd(n, m)
}