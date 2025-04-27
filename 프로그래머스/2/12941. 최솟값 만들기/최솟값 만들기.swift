import Foundation

func solution(_ A:[Int], _ B:[Int]) -> Int
{
    var ans = zip(A.sorted(), B.sorted(by: >)).map { $0 * $1 }.reduce(0,+)

    return ans
}