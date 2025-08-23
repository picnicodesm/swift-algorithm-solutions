func solution(_ expression:String) -> Int64 {
    var result = [Int]()
    
    // TODO: 문자열을 배열로 바꾸기
    var arr1 = [String]()
    var num = ""
    
    expression.forEach {
        if $0.isNumber {
            num += String($0)
        } else {
            arr1.append(num)
            arr1.append(String($0))
            num = ""
        }
    }
    arr1.append(num)
    
    // TODO: 연산자 우선순위 조합만들기
    let symbol = Set(expression.filter { $0 == "+" || $0 == "-" || $0 == "*" }).map { String($0) }
    var priorities = [[String]]()
    getPermutation(symbol, symbol.count, &priorities)
    
    // TODO: 연산자 우선순위에 따라 연산하기
    var arr2 = arr1
    priorities.forEach { priority in
        
        while arr2.count > 1 {
            
            priority.forEach { symbol in
                
                // 배열에 해당 기호가 없을 때까지 반복한다.
                while arr2.contains(symbol) {
                    let i = arr2.firstIndex(of: symbol)!
                    
                    var result = ""
                    switch symbol {
                    case "+":
                        result = String(Int(arr2[i-1])! + Int(arr2[i+1])!)
                    case "-":
                        result = String(Int(arr2[i-1])! - Int(arr2[i+1])!)
                    case "*":
                        result = String(Int(arr2[i-1])! * Int(arr2[i+1])!)
                    default:
                        break
                    }
                    arr2.replaceSubrange(i-1...i+1, with: [result])
                }
            }
        } // while문 종료
        
        // TODO: 연산결과 절댓값으로 변환하기
        result.append(abs(Int(arr2[0])!))
        arr2 = arr1
    }

    // TODO: 제일 큰값 내뱉기
    return Int64(result.max()!)
}

func getPermutation<T>(_ arr: [T], _ r: Int, _ res: inout [[T]], _ idx: Int = 0) {
    if idx == r {
        res.append(Array(arr[0..<idx]))
        return
    }
    
    var arr = arr
    
    for i in idx..<arr.count {
        arr.swapAt(idx, i)
        getPermutation(arr, r, &res, idx + 1)
        arr.swapAt(idx, i)
    }
}