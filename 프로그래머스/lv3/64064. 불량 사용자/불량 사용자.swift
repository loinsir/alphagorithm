import Foundation

func solution(_ user_id:[String], _ banned_id:[String]) -> Int {
    // 1. 문자열 매칭 판별
    func isEqual(str1: String, str2: String) -> Bool {
        guard str1.count == str2.count else { return false }
        
        for (c1, c2) in zip(str1, str2) {
            if c1 != c2 && c2 != "*" {
                return false
            }
        }
        return true
    }
    
    var visit = Array(repeating: false, count: user_id.count)
    var idList = Set<[String]>()
    func combi(index: Int) {
        if index == banned_id.count {
            let result = visit.enumerated().filter { $0.element }.map { user_id[$0.offset] }
            idList.insert(result)
            return
        }
        
        for i in 0..<user_id.count where visit[i] == false && isEqual(str1: user_id[i], str2: banned_id[index]) {
            visit[i] = true
            combi(index: index + 1)
            visit[i] = false
        }
    }
    combi(index: 0)
    
    return idList.count
}