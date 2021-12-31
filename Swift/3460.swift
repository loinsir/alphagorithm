let T = Int(readLine()!)!

for _ in 1...T {
    var output = [String]()

    var num = Int(readLine()!)!
    
    var index = 0
    while num != 0 {
        if num % 2 == 1 {
            output.append("\(index)")
        }
        index += 1
        num = Int(exactly: num / 2)!
    }
    print(output.joined(separator: " "))
}