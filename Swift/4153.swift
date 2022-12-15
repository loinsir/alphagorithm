import Foundation

while true {
    var input = readLine()!.split(separator: " ").map {Int(String($0))!}
    input.sort(by: < )
    if input.allSatisfy { $0 == 0 } {
        break
    }

    if pow(Double(input[0]), 2.0) + pow(Double(input[1]), 2.0) == pow(Double(input[2]), 2.0) {
        print("right")
    } else {
        print("wrong")
    }
}