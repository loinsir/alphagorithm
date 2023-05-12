let input = readLine()!.split(separator: " ").map { Int(String($0))! }
let (n, l) = (input[0], input[1])

let arr = readLine()!.split(separator: " ").map { Int(String($0))! }.sorted(by: < )

var start: Float = Float(arr[0]) - 0.5
var end: Float = start + Float(l)
var answer = 1
for i in 0..<arr.count {
    let pos = Float(arr[i]) + 0.5
    if start...end ~= pos {
        continue
    } else {
        answer += 1
        start = Float(arr[i]) - 0.5
        end = start + Float(l)
    }
}

print(answer)