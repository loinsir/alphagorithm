let N = Int(readLine()!)!
let cards = readLine()!.split(separator: " ").map { Int(String($0))! }
var dict: [Int: Int] = [:]
let M = Int(readLine()!)!
let lists = readLine()!.split(separator: " ").map { Int(String($0))! }

var results: [Int] = []

for card in cards {
    if dict.keys.contains(card) {
        dict[card]! += 1
    } else {
        dict[card] = 1
    }
}

for element in lists {
    if dict.keys.contains(element) {
        results.append(dict[element]!)
    } else {
        results.append(0)
    }
}

print(results.map{ String($0) }.joined(separator: " "))