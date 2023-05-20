import Foundation

func solution(_ tickets:[[String]]) -> [String] {
    var dict = [String: [String: Int]]()
    var answers = [[String]]()
    var portSet = Set<String>()
    
    for ticket in tickets {
        if dict[ticket[0]] == nil {
            dict[ticket[0]] = [ticket[1]: 1]
        } else if dict[ticket[0]]?[ticket[1]] == nil {
            dict[ticket[0]]![ticket[1]] = 1
        } else {
            dict[ticket[0]]![ticket[1]]! += 1
        }
        portSet.insert(ticket[0])
        portSet.insert(ticket[1])
    }
    print(dict)
    
    func dfs(_ ports: [String], _ depth: Int) {
        if Set(ports).count == portSet.count && depth == tickets.count {
            answers.append(ports)
            return
        }
        
        if dict[ports.last!] == nil {
            return
        }
        
        for target in Array(dict[ports.last!]!.keys).sorted() {
            if dict[ports.last!]![target]! > 0 {
                dict[ports.last!]![target]! -= 1
                dfs(ports + [target], depth + 1)
                dict[ports.last!]![target]! += 1
            }
        }
    }
    
    dfs(["ICN"], 0)
    return answers[0]
}