import Foundation

func solution(_ s:String, _ skip:String, _ index:Int) -> String {
    var skipSet: Set<Int> = []
    
    for c in skip {
        skipSet.insert(Int(c.asciiValue!))
    }
    
    let result: [Character] = s.map {
        var ascii = Int($0.asciiValue!)

        for _ in 0..<index {
            ascii += 1
            if ascii > 122 { ascii -= 26 }
            
            while skipSet.contains(ascii) {
                ascii += 1
                if ascii > 122 { ascii -= 26 }
            }
        }
        
        while skipSet.contains(ascii) {
            ascii += 1
            if ascii > 122 { ascii -= 26 }
        }
        
        return Character(UnicodeScalar(ascii)!)
    }
    
    return String(result)
}