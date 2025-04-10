func solution(_ s:String) -> String {
    var nums = s.split(separator: " ").map { Int(String($0))! }
    
    return "\(nums.min()!) \(nums.max()!)"
}