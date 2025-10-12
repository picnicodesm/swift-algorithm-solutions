import Foundation

func solution(_ code:String) -> String {
    var mode = 0
    var code = Array(code)
    var ret: [Character] = []
    
    for idx in 0..<code.count {
        if mode == 0 {
            if code[idx] == "1" {
                mode = 1
            } else {
                if idx % 2 == 0 {
                    ret.append(code[idx])
                }
            }
        } else {
            if code[idx] == "1" {
                mode = 0
            } else {
                if idx % 2 == 1 {
                    ret.append(code[idx])
                }
            }
        }
    }
    
    return ret.isEmpty ? "EMPTY" : String(ret)
}