func solution(_ a:Int, _ b:Int) -> Int64 {
    if a > b {
        return Int64((a-b+1) * (a + b) / 2)
    } else {
        return Int64((b-a+1) * (a + b) / 2) 
    }
    
}