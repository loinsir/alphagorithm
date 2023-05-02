let input = readLine()!.split(separator: " ").map { Int(String($0))! }
var (n, m, x, y, k) = (input[0], input[1], input[2], input[3], input[4])

var map = [[Int]]()
for _ in 0..<n {
    let row = readLine()!.split(separator: " ").map { Int(String($0))! }
    map.append(row)
}

let dirs = readLine()!.split(separator: " ").map { Int(String($0))! }
var dice = Array(repeating: 0, count: 6)

for i in 0..<dirs.count {
    roll(dirs[i])
}

func roll(_ dir: Int) {

    var nx = x, ny = y
    if dir == 1 { // 동
        ny += 1   
    } else if dir == 2 { // 서
        ny -= 1
    } else if dir == 3 { // 북
        nx -= 1
    } else { //남
        nx += 1
    }
    
    if 0..<map[0].count ~= ny && 0..<map.count ~= nx {
        if dir == 1 { // 동
            dice = [dice[3], dice[1], dice[0], dice[5], dice[4], dice[2]]
        } else if dir == 2 { // 서
            dice = [dice[2], dice[1], dice[5], dice[0], dice[4], dice[3]]
        } else if dir == 3 { // 북
            dice = [dice[4], dice[0], dice[2], dice[3], dice[5], dice[1]]
        } else { // 남
            dice = [dice[1], dice[5], dice[2], dice[3], dice[0], dice[4]]
        }
        
        if map[nx][ny] == 0 {
            map[nx][ny] = dice[5]
        } else {
            dice[5] = map[nx][ny]
            map[nx][ny] = 0
        }
        x = nx
        y = ny
        print(dice[0])
    }
} 