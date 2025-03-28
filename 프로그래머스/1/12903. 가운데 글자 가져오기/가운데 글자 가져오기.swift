func solution(_ s:String) -> String {
    var center = s.count / 2
    
    let index = s.index(s.startIndex, offsetBy: center)
    
    if s.count % 2 == 0 {
        let startIndex = s.index(before: index)
        return String(s[startIndex...index])
    } else {
        return String(s[index])
    }
}