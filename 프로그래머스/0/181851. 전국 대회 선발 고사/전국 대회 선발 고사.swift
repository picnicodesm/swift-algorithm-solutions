import Foundation

func solution(_ rank:[Int], _ attendance:[Bool]) -> Int {
    var people = rank.enumerated().filter { attendance[$0.offset] }.sorted(by: { $0.element < $1.element }).prefix(3).map { $0.offset }
    
    return 10000 * people[0] + 100 * people[1] + people[2]
}