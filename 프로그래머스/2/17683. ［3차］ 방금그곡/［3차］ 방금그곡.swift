import Foundation

func solution(_ m:String, _ musicinfos:[String]) -> String {
    var results: [(playTime: Int, musicName: String)] = [] 
    
    for musicInfo in musicinfos {
        let info = musicInfo.split(separator: ",").map { String($0) }
        let startTime: String = info[0]
        let endTime: String = info[1]
        let musicName: String = info[2]
        let melodyInfo: String = info[3]
        
        // 재생 길이 구하기
        let playTime = getPlayTime(startTime, endTime)
        
        // 사용된 음을 배열로 변환
        let melodyInfoArr = getMelody(from: melodyInfo)
        
        // 멜로디를 재생 길이만큼의 배열
        let playedMelodyArr = getPlayedMelodyArr(from: melodyInfoArr, playTime: playTime)
        
        // 기억하고 있는 멜로디가 있는지 확인: 슬라이딩 윈도우
        if hasMelody(m, in: playedMelodyArr) {
            results.append((playTime, musicName))
        }
    }
    
    // 음악 재생 시간이 긴 순으로 정렬
    results = results.sorted(by: { $0.playTime > $1.playTime })
    
    return results.isEmpty ? "(None)" : results.first!.musicName
}

func getPlayTime(_ s: String, _ e: String) -> Int {
    let sParts = s.split(separator: ":").map { Int($0)! }
    let eParts = e.split(separator: ":").map { Int($0)! }
    return (eParts[0] * 60 + eParts[1]) - (sParts[0] * 60 + sParts[1])
}

func getMelody(from melodyStr: String) -> [String] {
    var melodyArr: [String] = []
    
    for c in melodyStr {
        if c == "#" { melodyArr[melodyArr.count-1] = melodyArr.last! + "#" } 
        else { melodyArr.append(String(c)) }
    }
    
    return melodyArr
}

func getPlayedMelodyArr(from melodyArr: [String], playTime: Int) -> [String] {
    var playedMelodyArr: [String] = []
    
    for i in 0..<playTime {
        playedMelodyArr.append(melodyArr[i % melodyArr.count])
    }

    return playedMelodyArr
}

func hasMelody(_ melodyStr: String, in playedMelody: [String]) -> Bool {
    let melodyArr = getMelody(from: melodyStr)
    let windowSize = melodyArr.count
    
    if playedMelody.count < windowSize { return false }
    
    for i in 0..<playedMelody.count - windowSize + 1 {
        if melodyArr == Array(playedMelody[i..<i+windowSize]) { return true }
    }
    
    return false
}
