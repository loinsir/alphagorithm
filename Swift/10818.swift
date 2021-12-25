let N = Int(readLine()!)!
let arr = readLine()!.split(separator: " ").map {Int(String($0))!}

print("\(arr.min()!) \(arr.max()!)")

//https://velog.io/@ryan-son/Swift-10818-%EC%B5%9C%EC%86%8C-%EC%B5%9C%EB%8C%80-%EB%B0%B1%EC%A4%80-B3