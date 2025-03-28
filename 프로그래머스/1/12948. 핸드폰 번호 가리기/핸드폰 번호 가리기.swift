func solution(_ phone_number:String) -> String {    
    let startIndex = phone_number.index(phone_number.endIndex, offsetBy: -4) 
    let stars = String(repeating: "*", count: phone_number.count - 4)
    
    let lastString = phone_number[startIndex...]
    
    return stars + lastString
}