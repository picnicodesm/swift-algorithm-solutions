func solution(_ n:Int) -> Int {
    var fib = [0, 1]
    
    for i in 2...n {
        fib.append((fib[i-1] + fib[i-2]) % 1234567)
    }
    
    return fib[n]
}