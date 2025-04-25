import Foundation

func solution(_ start_num:Int, _ end_num:Int) -> [Int] {
    return stride(from: start_num, through: end_num, by: -1).map { $0 }
}