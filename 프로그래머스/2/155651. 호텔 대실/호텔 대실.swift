import Foundation

func solution(_ book_times:[[String]]) -> Int {
    typealias BookInfo = (startTime: Int, endTime: Int)
    var rooms: [BookInfo] = []
    
    for book_time in book_times.sorted(by: { $0[0] < $1[0] }) {
        var hasEmptyRoom = false
        var roomIndex = -1
        
        let book_time = book_time.map { Int($0.split(separator: ":").joined())! }
        let startTime = book_time[0]
        let endTime = Int(String(book_time[1]).suffix(2))! >= 50 ? book_time[1] + 50 : book_time[1] + 10
        let book: BookInfo = (startTime, endTime)
        
        for i in 0..<rooms.count {
            if rooms[i].endTime <= book.startTime { 
                hasEmptyRoom = true
                roomIndex = i
                break
            }
        }
        
        if rooms.isEmpty || !hasEmptyRoom { rooms.append(book) }
        if !rooms.isEmpty && hasEmptyRoom { rooms[roomIndex] = book }
    }    
    
    return rooms.count
}