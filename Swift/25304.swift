let X = Int(readLine()!)!
let N = Int(readLine()!)!

var totalPrice = 0

for i in 1...N {
    let line = readLine()!.split(separator: " ").map { Int(String($0))! }
    totalPrice += line[0] * line[1]
}

if totalPrice == X {
    print("Yes")
} else {
    print("No")
}