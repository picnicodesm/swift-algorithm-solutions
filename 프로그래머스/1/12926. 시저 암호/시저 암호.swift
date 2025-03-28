import Foundation

func solution(_ s:String, _ n:Int) -> String {
    
    let result: [String] = s.map { 
        if $0 == " " { return String($0) }
        
        let asciiValue = Int($0.asciiValue!)
        switch asciiValue {
            case 65...90:
                let asciiNumber = asciiValue + n > 90 ? (asciiValue+n) % 90 + 64 : asciiValue + n
                return String(UnicodeScalar(asciiNumber)!)
            default:
                let asciiNumber = asciiValue + n > 122 ? (asciiValue+n) % 122 + 96 : asciiValue + n
            return String(UnicodeScalar(asciiNumber)!)
        }
        
        return String(Int($0.asciiValue!))
    }

    return result.joined()
}