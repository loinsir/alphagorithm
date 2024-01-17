import Foundation

let g = Int(readLine()!)!

var answers = [Int]()

var primeNums = [Int]()
for n in 1...Int(sqrt(Double(g))) {
    if g % n == 0 {
        primeNums.append(n)
    }
}

for p in primeNums {
    let pair = g / p

    if (pair + p) % 2 == 0 && p != pair {
        answers.append((pair + p) / 2)
    }
}

answers.sort()
if answers.isEmpty {
    print(-1)
} else {
    answers.forEach { print($0) }
}