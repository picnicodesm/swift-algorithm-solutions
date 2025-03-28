import Foundation

func solution(_ a:Int, _ b:Int) -> String {
    let weekDays = ["THU", "FRI", "SAT", "SUN", "MON", "TUE", "WED"]
    let monthDays = [0, 31, 29, 31, 30, 31, 30, 31, 31, 30, 31, 30, 31]
    let weekIndex = (monthDays[1..<a].reduce(0, +) + b) % 7

    return weekDays[weekIndex]
}