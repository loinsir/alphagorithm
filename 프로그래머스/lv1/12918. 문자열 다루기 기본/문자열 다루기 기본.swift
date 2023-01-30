func solution(_ s:String) -> Bool {
    return (s.count == 4 || s.count == 6) && Array(s).allSatisfy { $0.isNumber }
}