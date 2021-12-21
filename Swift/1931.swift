import Foundation

var N = Int(readLine()!)!

var tasks: [[Int]] = []
for _ in 1...N {
    let task: [Int] = readLine()!.components(separatedBy: " ").map({Int($0)!})
    tasks.append(task)
}

tasks.sort{
    $0[1] < $1[1] ? $0[1] != $1[1] : $0[0] < $1[0]
}

var machine: [Int] = [tasks[0][1]]
for task in tasks[1...] {
    if machine.last! <= task[0] {
        machine.append(task[1])
    }
}

print(machine.count)