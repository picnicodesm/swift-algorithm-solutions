import Foundation

func solution(_ new_id:String) -> String {
    var charSet: Set<Character> = ["-", "_", ".", "1", "2", "3", "4", "5", "6", "7", "8", "9", "0"]
    
    // step 1 - n
    var result = new_id.lowercased()
    
    // step2 - n
    result = String(result.filter { 
        (Int($0.asciiValue!) >= 97 && Int($0.asciiValue!) <= 122) || charSet.contains($0) } 
    )

    // step3 - n
    var before = result.first!
    var temp: [Character] = result.enumerated().map { 
            if $0.offset != 0 {
                if before == "." && $0.element == "." {
                    return "!"
                } else {
                    before = $0.element
                    return $0.element
                }
            }
        
        return $0.element
    }.filter { $0 != "!" }
    
    // step4 - 1
    var startIndex = temp[0] == "." ? 1 : 0
    var endIndex = temp[temp.count-1] == "." ? temp.count-2 : temp.count-1
    
    // step5 - 1
    if startIndex > endIndex {
        temp = ["a"]
    } else {
        temp = Array(temp[startIndex...endIndex])
    }
    
    // step6 - 1
    if temp.count >= 16 {
        temp = Array(temp[0...14])
        if temp.last! == "." { temp.removeLast() }
    }
    
    // step7  - 1
    while temp.count <= 2 {
        temp.append(temp.last!)
    }
    
    return String(temp)
}