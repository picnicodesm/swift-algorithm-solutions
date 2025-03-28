import Foundation

func solution(_ num_list:[Int]) -> Int {
    let mul = num_list.reduce(1, *)
    let sum = num_list.reduce(0, +)
    return mul < sum * sum ? 1 : 0
}