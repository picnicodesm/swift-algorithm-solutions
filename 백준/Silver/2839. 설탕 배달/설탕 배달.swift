let input = Int(readLine()!)!

var share = input / 5
var remainder = input % 5
var count = share

while remainder % 3 != 0 {
    if share == 0 {
        count = -1
        remainder = 0
        break
        
    }
    share -= 1
    remainder = input - 5 * share
    count = share
}

print(count + remainder / 3)