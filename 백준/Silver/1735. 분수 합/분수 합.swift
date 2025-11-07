func gcd(_ a: Int, _ b: Int) -> Int {
    if b == 0 {
        return a
    } else {
        return gcd(b, a%b)
    }
}

let input1 = readLine()!.split(separator: " ").map { Int(String($0))! }
let input2 = readLine()!.split(separator: " ").map { Int(String($0))! }

var output: (Int, Int) = (input1[0] * input2[1] + input1[1] * input2[0], input1[1] * input2[1])
let gcdN = gcd(output.1, output.0)
print(output.0 / gcdN, output.1 / gcdN)