func solution(_ str1:String, _ str2:String) -> Int {
    var setA: Set<Fraction> = []
    var setB: Set<Fraction> = []
    let str1 = str1.lowercased()
    let str2 = str2.lowercased()
    
    for i in 0..<str1.count-1 {
        let frontIndex = str1.index(str1.startIndex, offsetBy: i)
        let backIndex = str1.index(after: frontIndex)
        let frontChar = str1[frontIndex]
        let backChar = str1[backIndex]
        
        if frontChar.isLetter && backChar.isLetter {
            let str = String("\(frontChar)\(backChar)")
            var num = 1
            var frac = Fraction(str: str, num: num)
            
            while setA.contains(frac) { frac.num += 1 }
            
            setA.insert(frac)
        } else { continue }
    }
    
    for i in 0..<str2.count-1 {
        let frontIndex = str2.index(str1.startIndex, offsetBy: i)
        let backIndex = str2.index(after: frontIndex)
        let frontChar = str2[frontIndex]
        let backChar = str2[backIndex]
        
        if frontChar.isLetter && backChar.isLetter {
            let str = String("\(frontChar)\(backChar)")
            var num = 1
            var frac = Fraction(str: str, num: num)
            
            while setB.contains(frac) { frac.num += 1 }
            
            setB.insert(frac)
        } else { continue }
    }
    
    let intersection = setA.intersection(setB)
    let union = setA.union(setB)
    
    if intersection.isEmpty && union.isEmpty { return 65536 }
    return Int((Double(intersection.count) / Double(union.count)) * 65536)
}

struct Fraction: Hashable {
    let str: String
    var num: Int
}