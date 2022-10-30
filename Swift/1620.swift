let input = readLine()!.split(separator: " ").map { Int(String($0))! }
let N = input[0], M = input[1]

var letterDict: [String: Int] = [:]
var digitDict: [Int: String] = [:]

for i in 1...N {
    let pokemon = readLine()!
    letterDict[pokemon] = i
    digitDict[i] = pokemon
}

for _ in 0..<M {
    let mInput = readLine()!
    if let search = Int(mInput) {
        print(digitDict[search]!)
    } else {
        print(letterDict[mInput]!)
    }
}