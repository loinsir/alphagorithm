let N = Int(readLine()!)!

var lists: [String] = []
for _ in 1...N {
    // let input = readLine()!.split(separator: " ").map {String($0)}
    lists.append(readLine()!)
}

lists.sort(by: {
    let left = Int($0.split(separator: " ")[0])!
    let right = Int($1.split(separator: " ")[0])!

    return left < right
})

for i in lists {
    print(i)
}