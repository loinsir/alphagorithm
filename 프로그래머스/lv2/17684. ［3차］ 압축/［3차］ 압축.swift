func solution(_ msg:String) -> [Int] {

    var message = Array(msg).map { String($0) }
    var answer = [Int]()
    
    var dict: [String: Int] = [:]
    
    // 1.
    for i in 1...26 {
        dict[String(UnicodeScalar(64 + i)!)] = i
    }
    
    // 2.
    var index = 0
    while index < message.count {
        var w = ""
        var nextIdx = index
        
        for i in index..<message.count {
            let nextW = w + message[i]
            if dict[nextW] != nil {
                w = nextW
                
                if index + w.count >= message.count {
                    answer.append(dict[w]!)
                    break
                }
                
            } else {
                answer.append(dict[w]!)
                dict[nextW] = dict.count + 1
                break
            }
        }
        
        index += w.count
    }
    
    return answer
    
}