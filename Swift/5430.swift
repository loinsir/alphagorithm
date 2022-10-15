import Foundation

let T = Int(readLine()!)!

for _ in 0..<T {
    let p = readLine()!
    let n = Int(readLine()!)!
    let line = readLine()!
    var arr: [Int]
    if line == "[]" {
        arr = []
    } else {
        arr = line.dropFirst().dropLast().components(separatedBy: ",").map { Int(String($0))! }
    }


    var left = 0, right = n-1
    var isReversed = false
    var isError = false
    
    for cmd in p {
        if cmd == "R" {
            isReversed.toggle()
        } else if cmd == "D" {
            if left > right {
                isError = true
                break
            }

            if isReversed {
                right -= 1
            } else {
                left += 1
            }
        }
    }

    if isError {
        print("error")
    } else if left > right {
        print("[]")
    } else {
        let answer = arr[left...right].map { String($0) }.joined(separator: ",")
        let reverseAns = arr[left...right].reversed().map { String($0) }.joined(separator: ",")

        if isReversed {
            print("["+reverseAns+"]")
        } else {
            print("["+answer+"]")
        }
    }
}