import Foundation

func solution(_ players:[Int], _ m:Int, _ k:Int) -> Int {
    var result = 0
    var servers: [Server] = []
    
    // index: 0~23
    for (time, playerNum) in players.enumerated() {
        let userCapacity = (servers.count + 1) * m - 1 // 현재 이용 가능한 이용자의 수
        
        if playerNum > userCapacity {
            let numOfNewServer = (playerNum - userCapacity - 1) / m + 1
            let newServers = Array(repeating: Server(endTime: time + k), count: numOfNewServer)
            servers += newServers
            result += numOfNewServer
        } 
        servers = servers.filter { time + 1 != $0.endTime }
    }
    
    return result
}

struct Server {
    let endTime: Int
}
