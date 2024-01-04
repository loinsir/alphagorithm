import Foundation

func solution(_ numbers:[Int]) -> String {  
    var numbers = numbers.sorted(by: {
        return Int(String($0) + String($1))! > Int(String($1) + String($0))!
    })
    
    if numbers.allSatisfy { $0 == 0 } {
        return "0"
    }
    
    return numbers.map { String($0) }.joined()
}