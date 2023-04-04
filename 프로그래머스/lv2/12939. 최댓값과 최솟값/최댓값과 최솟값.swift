func solution(_ s:String) -> String {
    let arr = s.split(separator: " ").map { Int(String($0))! }
    
    return "\(arr.min()!) \(arr.max()!)"
}