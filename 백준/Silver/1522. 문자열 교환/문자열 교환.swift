import Foundation

let string = Array(readLine()!)

solution(string)

func solution(_ stringArr: [Character]) {
    let windowSize = stringArr.filter { $0 == "a" }.count
    let stringSize = stringArr.count
    let countB = stringArr[0..<windowSize].filter { $0 == "b" }.count
    var countDic: [Character: Int] = ["a": 0, "b": countB]
    var result = countB
    
    for index in 1..<stringSize {
        let searchIndex = (index + windowSize - 1) % stringSize
        countDic[stringArr[index-1]]! -= 1
        countDic[stringArr[searchIndex]]! += 1
        result = min(result, countDic["b"]!)
    }
    
    print(result)
}