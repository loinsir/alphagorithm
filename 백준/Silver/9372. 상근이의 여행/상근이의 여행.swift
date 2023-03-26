let T = Int(readLine()!)!

for _ in 0..<T {
    let input = readLine()!.split(separator: " ").map { Int(String($0))! }
    let (N, M) = (input[0], input[1])
    for i in 0..<M {
        let _ = readLine()!.split(separator: " ").map {Int(String($0))!}
    }
    print(N-1)
}