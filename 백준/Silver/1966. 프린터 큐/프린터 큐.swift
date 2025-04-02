import Foundation

let N = Int(readLine()!)!

for _ in 0..<N {
    let input = readLine()!.split(separator: " ").map { Int(String($0))! }
    let priority = readLine()!.split(separator: " ").map { Int(String($0))! }
    let numOfArr = input[0]
    let findIndex = input[1]
    
    solution(numOfArr, findIndex, priority)
}

func solution(_ numOfArr: Int, _ findIndex: Int, _ priority: [Int]) {
    var sortedPriority = priority.sorted()
    var items: [Item] = priority.map { Item(priority: $0) }
    var count = 0
    var searchIndex = 0
    let findItem  = items[findIndex]
    
    while true {
        if sortedPriority.last! > items[searchIndex].priority {
            searchIndex = (searchIndex + 1) % items.count
        } else {
            count += 1
            
            if items[searchIndex].id == findItem.id { break }
            
            items.remove(at: searchIndex)
            _ = sortedPriority.popLast()
            searchIndex %= items.count
        }
    }
    
    print(count)
}

struct Item {
    let id = UUID()
    let priority: Int
}
