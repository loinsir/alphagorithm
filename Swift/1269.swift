let input = readLine()!.split(separator: " ").map {Int(String($0))!}
let A = readLine()!.split(separator: " ").map {Int(String($0))!}
let B = readLine()!.split(separator: " ").map {Int(String($0))!}

let setA = Set(A)
let setB = Set(B)

print(setA.union(setB).count - setA.intersection(setB).count)