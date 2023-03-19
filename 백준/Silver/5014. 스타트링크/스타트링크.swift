import Foundation

let input = readLine()!.split(separator: " ").map { Int(String($0))!}
let F = input[0], S = input[1], G = input[2], U = input[3], D = input[4]

var visited = Array(repeating: -1, count: F+1)
var queue = [(Int, Int)]()
queue.append((S, 0))
visited[S] += 1

var index = 0
var flag = true
while queue.count > index {
    let now = queue[index]
    
    if now.0 == G {
        print(now.1)
        flag = false
    }

    if now.0 + U <= F && visited[now.0 + U] == -1 {
        visited[now.0 + U] = 0
        queue.append((now.0 + U, now.1 + 1))
    }

    if now.0 - D > 0 && visited[now.0 - D] == -1 {
        visited[now.0 - D] = 0
        queue.append((now.0 - D, now.1 + 1))
    }

    index += 1
}
if flag {
    print("use the stairs")
}