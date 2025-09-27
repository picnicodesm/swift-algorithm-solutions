import Foundation

func solution(_ balls:Int, _ share:Int) -> Int {

    let k = min(share, balls - share)
    
    if k == 0 {
        return 1
    }
    
    var result = 1

    for i in 0..<k {
        result *= (balls - i)
        result /= (i + 1)
    }

    return result
}