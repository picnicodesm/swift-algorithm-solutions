var arr: [String] = []
let maxCharNum = 15

for _ in 0..<5 {
    let input: [String] = readLine()!.map {
        let value = String($0)
        arr.append(value)
        return value
    }
    
    arr.append(contentsOf: Array(repeating: "", count: maxCharNum - input.count))
}

for startIndex in 0..<maxCharNum {
    print("\(arr[startIndex+maxCharNum*0])\(arr[startIndex+maxCharNum*1])\(arr[startIndex+maxCharNum*2])\(arr[startIndex+maxCharNum*3])\(arr[startIndex+maxCharNum*4])", terminator: "")
}