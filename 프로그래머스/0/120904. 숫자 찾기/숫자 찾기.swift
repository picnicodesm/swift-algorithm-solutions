import Foundation

func solution(_ num:Int, _ k:Int) -> Int {
    if let index = String(num).map { String($0) }.firstIndex(of: String(k)) {
        return index + 1
    } else { return -1 }
}