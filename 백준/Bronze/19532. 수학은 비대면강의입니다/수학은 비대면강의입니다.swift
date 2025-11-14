let input = readLine()!.split(separator: " ").map { Int(String($0))! }
let a = input[0]
let b = input[1]
let c = input[2]
let d = input[3]
let e = input[4]
let f = input[5]

let x = (c*e - b*f) / (a*e - b*d)
let y = (c*d - a*f) / (b*d - a*e)

print(x, y)