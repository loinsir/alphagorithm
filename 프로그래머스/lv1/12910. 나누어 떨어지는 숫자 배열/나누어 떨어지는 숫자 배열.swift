func solution(_ arr:[Int], _ divisor:Int) -> [Int] {
    var answer = arr.filter { $0 % divisor == 0 }.sorted(by: < )
    return answer.isEmpty ? [-1] : answer
}