let N = Int(readLine()!)!

var tasks: [[Int]] = []
for _ in 0..<N {
    let input = readLine()!.split(separator: " ").map { Int(String($0))! }
    tasks.append(input)
}

// 예를 들어, (10, 10) 의 회의와 (9,10)회의가 있을 때, 둘의 종료 시간은 같지만, 
// (9,10)를 먼저 선택하면, (10,10)의 회의를 선택할 기회가 주어진다. 
// 하지만, (10, 10)의 회의가 먼저 선택되면, 종료시간이 10을 넘어갔기 때문에 9시작은 고려되지 않는다.
// 따라서 시작시간으로 먼저 정렬을 해준 후에, 종료 시간을 기준으로 정렬을 해준다.
tasks.sort(by: { $0[0] < $1[0] } )
tasks.sort(by: { $0[1] < $1[1] })

var count = 0
var end = 0
for task in tasks {
    if task[0] >= end {
        end = task[1]
        count += 1
    }
}
print(count)