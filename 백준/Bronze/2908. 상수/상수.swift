let input = readLine()!.split(separator: " ")
let num1 = Int(String(input[0].reversed()))!
let num2 = Int(String(input[1].reversed()))!
print(max(num1, num2))