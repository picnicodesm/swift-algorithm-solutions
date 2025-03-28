import Foundation

func solution(_ array:[Int], _ commands:[[Int]]) -> [Int] {
    var result: [Int] = []
    
    for command in commands {
        let firstIndex = command[0] - 1
        let lastIndex = command[1] - 1
        var sliceArray = array[firstIndex...lastIndex].sorted()

        result.append(sliceArray[command[2]-1])
    }
    
    return result
}