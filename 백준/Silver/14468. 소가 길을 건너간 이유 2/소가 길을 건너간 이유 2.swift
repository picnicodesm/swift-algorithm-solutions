import Foundation

let input = Array(readLine()!)

solution(input)

func solution(_ cowsPath: [Character]) {
    var indices: [[Int]] = Array(repeating: [], count: 26)
    var meet: [[Character]] = Array(repeating: [], count: 26)
    var result = Set<String>()
    
    // 각 소의 출입구 인덱스 저장
    for (index, cow) in cowsPath.enumerated() {
        indices[Int(cow.asciiValue!)-65].append(index)
    }
    
    // 각 소가 만나는 소 저장
    for index in 0..<indices.count { // 26회
        // 각 소의 출입을 양끝으로 가진 부분 배열 안에 unique한 소가 몇마리인지
        var temp = Set<Character>()
        for cow in Array(cowsPath[indices[index][0]...indices[index][1]]) {
            if temp.contains(cow) {
                temp.remove(cow)
            } else {
                temp.insert(cow)
            }
        }
        meet[index] = Array(temp)
    }
    
    // 각 소가 만난 소의 집합을 구함
    for index in 0..<indices.count {
        for metCow in meet[index] {
            let currentCow = Character(UnicodeScalar(65 + index)!)
            if !(result.contains("\(currentCow)\(metCow)") || result.contains("\(metCow)\(currentCow)")) {
                result.insert("\(currentCow)\(metCow)")
            }
        }
    }
    
    print(result.count)
}