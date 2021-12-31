let T = Int(readLine()!)!

for _ in 1...T {
    var input = readLine()!.split(separator: " ").map { Int($0)! }
    input.sort(by: {$0 > $1})
    print(input[2])
}