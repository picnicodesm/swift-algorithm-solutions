import Foundation

func solution(_ s:String) -> [Int] {
    var result = s
    var removed = 0
    var convert = 0
    
    while result != "1" {
        convert += 1
        result = String(result.compactMap {
            if $0 == "0" {
                removed += 1
                return nil
            } else {
                return $0
            }
        })
        
        result = String(result.count, radix:2)
    }
    
    return [convert, removed]
}