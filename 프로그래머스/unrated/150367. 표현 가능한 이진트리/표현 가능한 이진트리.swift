import Foundation

func solution(_ numbers:[Int64]) -> [Int] {
    
    var answer = [Int]()
    
    for num in numbers {
        var binary = String(num, radix: 2)
        
        var length = 1
        while length < binary.count {
            length = length * 2 + 1
        }
        length -= binary.count
        
        var zeroPrefix = ""
        for i in 0..<length {
            zeroPrefix += "0"
        }
        binary = zeroPrefix + binary
        
        if depthCheck(binary) {
            answer.append(1)
        } else {
            answer.append(0)
        }
    }
    
    return answer
}

func depthCheck(_ str: String) -> Bool {
    if str.count == 1 {
        return true
    } else if str.count == 2 {
        return false
    } else {
        var root = str[str.index(str.startIndex, offsetBy: str.count / 2)]
        var lefts = String(str[str.startIndex..<str.index(str.startIndex, offsetBy: str.count / 2)])
        var rights = String(str[str.index(str.startIndex, offsetBy: str.count / 2 + 1)...])
        
        if root == "0" {
            if lefts.contains("1") || rights.contains("1") {
                return false
            }
        }
        return depthCheck(lefts) && depthCheck(rights)
    }
}