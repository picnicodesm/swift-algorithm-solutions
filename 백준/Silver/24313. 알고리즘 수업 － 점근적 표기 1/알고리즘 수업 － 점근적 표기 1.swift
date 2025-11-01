var n = 1
let a = readLine()!.split(separator: " ").map { Int(String($0))! }
let c = Int(readLine()!)!
let n0 = Int(readLine()!)!

n = n0
let f_n = a[0] * n + a[1]
let g_n = n

if a[0] < 0 {
    if f_n <= c * g_n {
        print(1)
    } else {
        print(0)
    }
} else {
    if a[0] == c {
        if a[1] < 0 {
            print(1)
        } else {
            print(0)
        }
    } else {
        if a[0] < c {
            if f_n <= c * g_n {
                print(1)
            } else {
                print(0)
            }
        } else {
            print(0)
        }
    }
}