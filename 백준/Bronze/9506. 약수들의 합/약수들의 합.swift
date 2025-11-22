while true {
    let input = Int(readLine()!)!
    if input == -1 { break }
    var factors: [Int] = []

        
    for e in 1..<input {
        if input % e == 0 {
            factors.append(e)
        }
    }
    
    if factors.reduce(0, +) == input {
        print("\(input) =", terminator: " ")
        for factor in factors {
            if factor == factors.last! {
                print(factor)
            } else {
                print(factor, terminator: " + ")
            }
        }
    } else {
        print("\(input) is NOT perfect.")
    }
}