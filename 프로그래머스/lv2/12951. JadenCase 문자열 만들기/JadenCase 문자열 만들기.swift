func solution(_ s:String) -> String {
    var result: [String] = []
    var isStart = true
    for w in s {
        if isStart && w != " " {
            if w.isLetter {
                result.append("\(w)".uppercased())
            } else {
                result.append("\(w)")
            }
            isStart = false
        } else {
            if w == " " {
                result.append(" ")
                isStart = true
            } else {
                result.append("\(w)".lowercased())
                isStart = false
            }
        }
    }
    return result.joined(separator: "")
}