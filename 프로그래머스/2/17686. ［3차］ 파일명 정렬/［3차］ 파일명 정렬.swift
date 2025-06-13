func solution(_ files:[String]) -> [String] {
    var fileDic: [String: (head: String, num: Int, tail: String, idx: Int)] = [:]

    for (i, file) in files.enumerated() {
        var head: [Character] = []
        var num: [Character] = []
        var tail: [Character] = []
        var isHead = true
        var isNum = false
        var numCount = 0
        
        for c in file {
            if isHead {
                if Int(String(c)) != nil { 
                    isHead = false
                    isNum = true
                    num.append(c)
                    continue
                }
                head.append(c)
            } else if numCount < 5 && isNum {
                if Int(String(c)) == nil { 
                    isNum = false
                    tail.append(c)
                    continue
                }
                num.append(c)
                numCount += 1
            } else {
                tail.append(c)
            }
        }
        
        fileDic[file] = (String(head).lowercased(), Int(String(num))!, String(tail).lowercased(), i)
    }
    
    let result = fileDic.sorted(by: { 
        if $0.value.head == $1.value.head { 
            if $0.value.num == $1.value.num { return $0.value.idx < $1.value.idx }
            return $0.value.num < $1.value.num
        } else {
            return $0.value.head < $1.value.head
        }
    })

    return result.map { $0.key }
}