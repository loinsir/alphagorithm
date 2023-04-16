let n = Int(readLine()!)!

var dict = [String: Bool]()
for _ in 0..<n {
    let input = readLine()!.split(separator: " ").map { String($0) }
    let name = input[0], action = input[1]
    
    if let named = dict[name] {
        dict[name] = action == "enter" ? true : false
    } else {
        dict[name] = true
    }
}

var answer = [String]()

for (key, value) in dict {
    if value {
        answer.append(key)
    }
}

answer = answer.sorted().reversed()

for name in answer {
    print(name)
}