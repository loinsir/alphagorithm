let N = Int(readLine()!)!

var dict: [Int: Int] = [:]
let input = readLine()!.split(separator: " ").map { Int(String($0))! }

for i in input {
    dict[i] = 0
}

let M = Int(readLine()!)!

let input2 = readLine()!.split(separator: " ").map { Int(String($0))! }

for i in input2 {
    if let exist = dict[i] {
        print(1, terminator: " ")
    } else {
        print(0, terminator: " ")
    }
}