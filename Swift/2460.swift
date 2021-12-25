var currents = 0
var max = 0
for _ in 1...10 {
    let input = readLine()!.split(separator: " ").map{ Int(String($0))! }
    let inner = input[1]
    let outter = input[0]

    currents -= outter
    currents += inner
    if currents > max {
        max = currents
    }
}

print(max)