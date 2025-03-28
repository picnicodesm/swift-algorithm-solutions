func solution(_ strings:[String], _ n:Int) -> [String] {
    var store: [[String]] = []
    
    for string in strings {
        let index = string.index(string.startIndex, offsetBy: n)
        store.append([String(string[index]), string])
        
    }
    
    let result = store.sorted {
        if $0[0] == $1[0] {
            return $0[1] < $1[1]
        } else {
            return $0[0] < $1[0]
        }
    }.map { $0[1] }
    
    return result
}