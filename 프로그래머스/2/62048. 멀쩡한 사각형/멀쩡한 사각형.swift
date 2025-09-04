import Foundation

func solution(_ w:Int, _ h:Int) -> Int64{
    let totalSpace: Int64 = Int64(w) * Int64(h)
    
    let (portion, uselessSpace) = useless(w, h)
    
    return totalSpace - (uselessSpace * portion)
}

func useless(_ w: Int, _ h: Int) -> (portion: Int64, uselessSpace: Int64) {
    // 1. w와 h를 서로소로 만든다.
    let gcd = getGcd(w, h)
    let minWidth = w / gcd
    let minHeight = h / gcd
    
    let totalSpace = minWidth * minHeight
    
    // 2. 직선의 방정식
    func linearEquation(_ x: Int) -> Double { 
        let a = -(Double(minHeight) / Double(minWidth))
        return a * Double(x) + Double(minHeight)
    }
    
    // 3. 사용할 수 있는 공간을 구함
    var useSpace = 0
    for i in 1..<minWidth {
        useSpace += Int(linearEquation(i))
    }
    
    // 4. 전체에서 사용할 공간의 2배를 뺌
    let useless = totalSpace - 2 * useSpace
    
    return (Int64(gcd), Int64(useless))
}

func getGcd(_ a: Int, _ b: Int) -> Int {
    if b == 0 { return a }
    
    return getGcd(b, a % b)
}