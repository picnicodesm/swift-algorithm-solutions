func solution(_ msg:String) -> [Int] {
    // 1000글자 이하
    var dic: [String: Int] = [:]
    let msgChar = Array(msg)
    var currentIndex = 0
    var result: [Int] = []
    
    for i in 1...26 {
        dic[String(UnicodeScalar(64 + i)!)] = i
    }
    
    while currentIndex < msgChar.count {
        var add = 0
        var str = String(msgChar[currentIndex])
        
        while dic.keys.contains(str) {
            add += 1 
            if currentIndex+add < msgChar.count {
                str += String(msgChar[currentIndex+add])
            } else {
                result.append(dic[str]!)
                return result
            }
        }
            
        dic[str] = dic.count+1
        str.removeLast()
        result.append(dic[str]!)
        currentIndex = currentIndex+add 
    }
    
    return []
}