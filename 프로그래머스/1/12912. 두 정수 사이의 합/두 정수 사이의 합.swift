func solution(_ a:Int, _ b:Int) -> Int64 {
    let min = min(a, b)
    let max = max(a, b)
    return Int64(Array(min...max).reduce(0, +))
}