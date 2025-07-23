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

// 일단 먼저 입실하는 것 순으로 정렬을 하자.
// 14:10-19:20, 14:20-15:20, 15:00-17:00, 16:40-18:20, 18:20-21:20
// 쓰고 있는 방이 있으면 끝나는 시간인지 확인
// 하나 볼 때마다 모든 큐를 봐야 한다고 하면, n^2인데 길이가 1000이니까 가능해
// rooms 배열을 탐색하면서 해당 큐로 들어가.

// 문자열로 시간을 다룰 때 10분을 더한다고 하면 50분부터는 시를 늘려야 해.
// 정수형으로 바꾸면 뒷 두자리가 50 이상이면 1558 -> 1608이니까 10분 늘어나면 40을 더 늘리면 되나
// 1353 -> 1403...오 총 50을 늘리면 되네