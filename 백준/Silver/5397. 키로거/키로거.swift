import Foundation

let count = Int(readLine()!)!

for _ in 0..<count {
    var left = [Character]()
    var right = [Character]()
    
    let input = readLine()!
    
    for i in input {
        if i == "<" {
            if !left.isEmpty { right.append(left.removeLast()) }
        }
        else if i == ">" {
            if !right.isEmpty { left.append(right.removeLast()) }
        }
        else if i == "-" {
            if !left.isEmpty { left.removeLast() }
        }
        else {
            left.append(i)
        }
    }
    
    print(String(left + right.reversed()))
}