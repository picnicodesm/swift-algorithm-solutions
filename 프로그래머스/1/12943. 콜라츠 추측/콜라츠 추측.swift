func solution(_ num:Int) -> Int {
    
    if num == 1 { return 0 }
    
    var count = 0
    var n = num
    while count <= 500 && n != 1 {
        if n % 2 == 0 { n /= 2 }
        else { n = 3 * n + 1 }
        count += 1
    }
    
    if count > 500 { return -1 }
    
    return count
}