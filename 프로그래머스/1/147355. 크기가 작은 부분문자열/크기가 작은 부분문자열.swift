import Foundation

func solution(_ t:String, _ p:String) -> Int {
    var count = 0 
    
    for i in 0...t.count-p.count {
        let subInt = Int(String(Array(t)[i..<i+p.count]))!
        if subInt <= Int(p)! {
            count += 1
        }
    }
    
    return count
}