import Foundation

func solution(_ record:[String]) -> [String] {
    var record: [[String]] = record.map { $0.split(separator: " ").map { String($0) }}
    var nameMap = [String: String]()

    for i in record {
        if i[0] == "Enter" || i[0] == "Change" {
            nameMap[i[1]] = i[2]
        }
    }
    
    var result = [String]()
    for i in record {
        if i[0] == "Enter" {
            result.append("\(nameMap[i[1]]!)님이 들어왔습니다.")
        } else if i[0] == "Leave" {
            result.append("\(nameMap[i[1]]!)님이 나갔습니다.")
        }
    }
    
    return result
}