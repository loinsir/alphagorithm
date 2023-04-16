let n = Int(readLine()!)!

var dict = [String: Int]()
for i in 0..<n {
    let name = readLine()!
    if let bookName = dict[name] {
        dict[name]! += 1
    } else {
        dict[name] = 1
    }
}

var maxValue = 0
for (key, value) in dict {
    maxValue = max(maxValue, value)
}

var answers = [String]()

for (key, value) in dict {
    if maxValue == value {
        answers.append(key)
    }
}

print(answers.sorted().first!)