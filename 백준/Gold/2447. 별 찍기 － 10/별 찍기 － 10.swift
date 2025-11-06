let n = Int(String(readLine()!))!
var star = ""
for i in 0..<n {
    for j in 0..<n {
        printStar(n,i,j)
    }
    star += "\n"
}
print("\(star)")
func printStar(_ n: Int, _ i: Int, _ j: Int) {
    if (i / n) % 3 == 1 && (j / n) % 3 == 1 {
        star += " "
    }else {
        if n / 3 == 0 {
            star += "*"
        }else {
            printStar(n / 3, i, j)
        }
    }
}