import Foundation

func solution(_ clothes:[[String]]) -> Int {
    
    var hash: [String:[String]] = [:]
    
    for cloth in clothes {
        if let val = hash[cloth.last!] {
            hash[cloth.last!]!.append(cloth.first!)
        } else {
            hash[cloth.last!] = [cloth.first!]
        }
    }
    
    var result = 1
    for (k, v) in hash {
        result *= v.count+1
    }
    
    return result - 1
}