import Foundation

func solution(_ num_list:[Int]) -> [Int] {
    let last = num_list.last!
    let beforeLast = num_list[num_list.count-2]
    var result = num_list
    
    if last > beforeLast { result.append(last-beforeLast) }
    else { result.append(last * 2) }
    
    return result
}