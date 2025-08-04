import Foundation

func solution(_ orders:[String], _ course:[Int]) -> [String] {
    var alphabet: [Character] = Array(0...25).map { Character(UnicodeScalar(65+$0)!) }
    var combinations: [String: Int] = [:]
    var result: [String] = []
    let maxLength = course.last!
    let course = Set(course)

    func dfs(combi: String, combiLength: Int, order: [Character], index: Int) {
       if index > order.count-1 || combiLength >= maxLength { return }
        
        let combi = combi + String(order[index])
        let length = combiLength + 1
        
        if course.contains(length) { 
            combinations[combi, default: 0] += 1
        }
       
        if length == order.count { return }
    
        for i in 1...order.count-length {
            dfs(combi: combi, combiLength: length, order: order, index: index + i)
        }
    }
    
    for order in orders {
        let order = Array(order).sorted()
        for i in 0..<order.count {
            dfs(combi: "", combiLength: 0, order: order, index: i)
        }
    }

    for courseCount in course {
        let filtered = combinations.filter { $0.key.count == courseCount && $0.value > 1 }
        var selected: [String] = []
        var maxCount = 0
        
        for (combi, count) in filtered {
            if count > maxCount {
                selected = []
                selected.append(combi)
                maxCount = count
            } else if count == maxCount {
                selected.append(combi)
            }
        }
        
        result.append(contentsOf: selected)
    }
    
    return result.sorted()
}
