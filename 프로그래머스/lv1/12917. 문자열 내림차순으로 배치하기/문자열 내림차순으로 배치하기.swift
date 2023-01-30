func solution(_ s:String) -> String {
    return Array(s).map{ String($0) }.sorted(by: > ).joined(separator: "")
}