import Foundation

func solution(_ info:[String], _ query:[String]) -> [Int] {
    var dict = [String: [Int]]()
    var answer = [Int]()
    
    for i in info {
        let str = i.split(separator: " ").map {String($0)}
        
        for lang in ["-", str[0]] {
            for job in ["-", str[1]] {
                for age in ["-", str[2]] {
                    for food in ["-", str[3]] {
                        let key = [lang, job, age, food].joined(separator: " ")
                        if dict[key] == nil {
                            dict[key] = [Int(str[4])!]
                        } else {
                            dict[key]!.append(Int(str[4])!)
                        }
                    }
                }
            }
        }
    }
    
    for (key, value) in dict {
        dict[key]!.sort(by: < )
    }
    
    for q in query {
        let qStr = q.replacingOccurrences(of: " and", with: "").split(separator: " ").map { String($0) }
        let key = [qStr[0], qStr[1], qStr[2], qStr[3]].joined(separator: " ")
        var count = 0
        
        if let scores = dict[key] {
            if scores.count == 1 {
                if scores.first! >= Int(qStr[4])! {
                    count = 1
                }
            } else if scores.last! < Int(qStr[4])! {
                count = 0
            } else {
                var low = 0
                var high = scores.count - 1
                while low < high {
                    let mid = (low + high) / 2
                    if scores[mid] < Int(qStr[4])! {
                        low = mid + 1
                    } else {
                        high = mid
                    }
                }
                
                count = scores.count - high
            }
        }
        answer.append(count)
    }
    
    return answer
}