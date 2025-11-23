func getPactorial(n: Int) -> Int{
    if n == 0 { return 1}
    return n * getPactorial(n: n-1)
}

let input = Int(readLine()!)!
print(getPactorial(n: input))