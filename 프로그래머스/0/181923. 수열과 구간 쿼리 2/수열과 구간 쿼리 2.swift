import Foundation

func solution(_ arr:[Int], _ queries:[[Int]]) -> [Int] {
    var result: [Int] = []
    
    for query in queries {
        var searchField: [Int] = []
        
        for i in query[0]...query[1] {
            if arr[i] > query[2] {
                searchField.append(arr[i])
            }
        }
        
        let minNum = searchField.isEmpty ? -1 : searchField.sorted()[0]
        result.append(minNum)
    }
    
    return result
}