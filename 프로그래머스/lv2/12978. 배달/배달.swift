import Foundation

func solution(_ N:Int, _ road:[[Int]], _ k:Int) -> Int {
    
    // 각 정점으로부터의 거리를 저장할 배열 정의
    var allDistances = Array(repeating: Array(repeating: Int.max, count: N+1), count: N+1)
    
    // 본인 자신은 거리를 0으로 초기화
    for i in 1...N {
        allDistances[i][i] = 0
    }
    
    // road 값 들을 넣어줌
    for r in road {
        if allDistances[r[0]][r[1]] != 0 {
            allDistances[r[0]][r[1]] = min(allDistances[r[0]][r[1]], r[2])
            allDistances[r[1]][r[0]] = min(allDistances[r[1]][r[0]], r[2])
        } else {
            allDistances[r[0]][r[1]] = r[2]
            allDistances[r[1]][r[0]] = r[2]
        }
    }
    
    for i in 1...N {
        for j in 1...N {
            for k in 1...N {
                if allDistances[j][i] == Int.max || allDistances[i][k] == Int.max { continue }
                allDistances[j][k] = min(allDistances[j][k], allDistances[j][i] + allDistances[i][k])
            }
        }
    }
    
    return allDistances[1].filter { $0 <= k }.count
}