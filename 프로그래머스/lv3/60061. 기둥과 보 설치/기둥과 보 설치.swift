import Foundation

func solution(_ n:Int, _ build_frame:[[Int]]) -> [[Int]] {
    var arr = Array(repeating: Array(repeating: Array(repeating: 0, count: 2), count: n+1), count: n+1)
    var answer = [[Int]]()
    
    for build in build_frame {
        let x = build[0], y = build[1], a = build[2], b = build[3]
        
        if b == 1 { // 설치
            if a == 0 { // 기둥
                if y == 0 || 
                x-1 >= 0 && arr[x-1][y][1] == 1 ||
                arr[x][y][1] == 1 ||
                y-1 >= 0 && arr[x][y-1][0] == 1 {
                    arr[x][y][0] = 1
                }
            } else { // 보
                if y-1 >= 0 && arr[x][y-1][0] == 1 ||
                x+1 <= n && y-1 >= 0 && arr[x+1][y-1][0] == 1 ||
                x-1 >= 0 && arr[x-1][y][1] == 1 && x+1 <= n && arr[x+1][y][1] == 1 {
                    arr[x][y][1] = 1
                }
            }
            
        } else { // 삭제
            if a == 0 { // 기둥
                if y+1 <= n && arr[x][y+1][0] == 1 { // 기둥 위 기둥
                    
                    guard x-1 >= 0 && y+1 <= n && arr[x-1][y+1][1] == 1 ||
                    y+1 <= n && arr[x][y+1][1] == 1 else {
                        continue
                    }
                }
                
                if y+1 <= n && arr[x][y+1][1] == 1 {
                        guard x+1 <= n && arr[x+1][y][0] == 1 ||
                        x-1 >= 0 && y+1 <= n && arr[x-1][y+1][1] == 1 && x+1 <= n && y+1 <= n && arr[x+1][y+1][1] == 1 else {
                            continue
                        }
                } 
                if y+1 <= n && x-1 >= 0 && arr[x-1][y+1][1] == 1 {
                    guard x-1 >= 0 && arr[x-1][y][0] == 1 ||
                    x-2 >= 0 && y+1 <= n && arr[x-2][y+1][1] == 1 && y+1 <= n && arr[x][y+1][1] == 1 else {
                        continue
                    }
                }
                
                arr[x][y][0] = 0
            } else { // 보
                if x+1 <= n && arr[x+1][y][0] == 1 {
                    guard arr[x+1][y][1] == 1 ||
                    arr[x+1][y-1][0] == 1 else {
                        continue
                    }
                } 
                if arr[x][y][0] == 1 {
                    guard x-1 >= 0 && arr[x-1][y][1] == 1 || y-1 >= 0 && arr[x][y-1][0] == 1 else {
                        continue
                    }
                } 
                
                if x+1 <= n && arr[x+1][y][1] == 1 {
                    guard x+1 <= n && y-1 >= 0 && arr[x+1][y-1][0] == 1 || x+2 <= n && y-1 >= 0 && arr[x+2][y-1][0] == 1 else {
                        continue
                    }
                } 
                
                if x-1 >= 0 && arr[x-1][y][1] == 1 {
                    guard x-1 >= 0 && y-1 >= 0 && arr[x-1][y-1][0] == 1 ||
                    y-1 >= 0 && arr[x][y-1][0] == 1 else {
                        continue
                    }
                }
                
                arr[x][y][1] = 0
            }
        }
    }
    
    
    
    for i in 0...n {
        for j in 0...n {
            for a in 0...1 {
                if arr[i][j][a] == 1 {
                    answer.append([i, j, a])
                }
            }
        }
    }
    
    return answer
}