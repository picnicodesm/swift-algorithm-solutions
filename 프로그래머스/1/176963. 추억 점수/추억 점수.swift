import Foundation

func solution(_ name:[String], _ yearning:[Int], _ photo:[[String]]) -> [Int] {
    var dic: [String: Int] = [:]
    
    for index in 0..<name.count {
        dic[name[index]] = yearning[index]
    }
    
    let result: [Int] = photo.map {
        $0.compactMap { dic[$0] }.reduce(0,+)
    }
    
    return result
}