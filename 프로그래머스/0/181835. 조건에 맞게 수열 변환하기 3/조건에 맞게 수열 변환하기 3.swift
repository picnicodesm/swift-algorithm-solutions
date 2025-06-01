import Foundation

func solution(_ arr:[Int], _ k:Int) -> [Int] {
    return k % 2 == 0 ? arr.map { $0 + k } : arr.map { $0 * k }
}