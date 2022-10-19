let input = readLine()!.split(separator: " ").map { Int(String($0))! }
let N = input[0]
var K = input[1]

var coins: [Int] = []
var count = 0

for _ in 0..<N {
    let coin = Int(readLine()!)!
    coins.append(coin)
}

for coin in coins.reversed() {
    if coin <= K {
        count += Int(K / coin)
        K %= coin
    }
}

print(count)