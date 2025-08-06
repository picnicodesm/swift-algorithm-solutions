import Foundation

func solution(_ n:Int, _ slicer:[Int], _ num_list:[Int]) -> [Int] {
    if n == 1 { return Array(num_list[...slicer[1]]) }
    else if n == 2 { return Array(num_list[slicer[0]...]) }
    else if n == 3 { return Array(num_list[slicer[0]...slicer[1]]) }
    else { 
        var result: [Int] = []
        
        for i in stride(from: slicer[0], through: slicer[1], by: slicer[2]) {
            result.append(num_list[i])
        }
        
        return result
    }
}