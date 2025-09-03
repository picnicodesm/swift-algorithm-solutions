import Foundation

func solution(_ s:String) -> Int {
    var minValue = s.count
    
    for i in 1...s.count {
        let compressedLength = compress(s, by: i)
        minValue = min(minValue, compressedLength)
    }
    
    return minValue
}

func compress(_ s : String, by length: Int) -> Int {
    let charArrOfStr = Array(s)
    var compressed = ""
    var repeatNum = 1
    var beforeWindow = String(Array(charArrOfStr[0..<length]))
    var currentWindow = ""
    
    for i in stride(from: length, to: charArrOfStr.count, by: length) {
        if i + length > charArrOfStr.count {
            compressed += ((repeatNum == 1 ? "" : String(repeatNum)) + String(beforeWindow))
            compressed += String(Array(charArrOfStr[i...]))

            return compressed.count
        } else {
            currentWindow = String(charArrOfStr[i..<i+length])
            
            if beforeWindow == currentWindow {
                repeatNum += 1
            } else {
                compressed += ((repeatNum == 1 ? "" : String(repeatNum)) + String(beforeWindow))
                repeatNum = 1
                beforeWindow = currentWindow
            } 
        }
    }
    
    compressed += ((repeatNum == 1 ? "" : String(repeatNum)) + String(beforeWindow))
    
    return compressed.count   
}