import Foundation

func solution(_ w:Int, _ h:Int) -> Int64{
    
    func linearEquation(_ x: Int) -> Double {
        let a: Double = -(Double(h)/Double(w))
        return a * Double(x) + Double(h)
    }
    
    var useSpace: Int64 = 0
    
    for i in 1..<w {
        useSpace += Int64(linearEquation(i))
    }
    
    return useSpace * 2
}
