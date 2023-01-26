func solution(_ a:Int, _ b:Int) -> Int64 {
    var answer: Int64 = 0
    var a = Int64(a), b = Int64(b)
    if a > b {
        for n in b...a {
            answer += n
        }
    } else {
        for n in a...b {
            answer += n
        }
    }
    return answer
}