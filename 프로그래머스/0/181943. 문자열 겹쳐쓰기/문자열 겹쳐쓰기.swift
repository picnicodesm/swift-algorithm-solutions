import Foundation

func solution(_ my_string:String, _ overwrite_string:String, _ s:Int) -> String {
    var myStr = Array(my_string)
    var overwriteStr = Array(overwrite_string)

    for i in 0..<overwriteStr.count {
        myStr[s + i] = overwriteStr[i]
    }

    return String(myStr)
}