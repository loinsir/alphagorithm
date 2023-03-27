func solution(_ n:Int, _ t:Int, _ m:Int, _ p:Int) -> String {
    let targetLength = m * t
    var orderString = ""
    var answer = ""
    
    var num = 0
    while targetLength >= orderString.length {
        orderString += String(num, radix: n)
        num += 1
    }
    print(orderString)

    var idx = p - 1
    let arr = Array(orderString).map { String($0) }

    while answer.count < t {
        answer += arr[idx]
        idx += m
    }
    
    return answer.uppercased()
}