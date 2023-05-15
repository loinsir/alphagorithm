import Foundation

let n = Int(readLine()!)!
var flowers = [[Int]]() // 피는 시기, 지는 시기

let minDays = 301
let maxDays = 1130

for _ in 0..<n {
    let input = readLine()!.split(separator: " ").map { Int(String($0))! }
    let (sm, sd, em, ed) = (input[0], input[1], input[2], input[3])
    
    var startDays = sm * 100 + sd
    var endDays = em * 100 + ed
    
    if endDays >= minDays { // 3월 1일 보다 빨리피면 입력 안받음
        if startDays <= minDays { // 3월 1일 보다 빨리피면 피는 시작일을 3월 1일로 변경
            flowers.append([minDays, endDays])
        } else {
            flowers.append([startDays, endDays])
        }
    }
}

flowers.sort(by: { $0[0] < $1[0] }) // 시작 날짜 기준 오름차순 정렬

var start = minDays // 이전 시작일
var max = 0 // 이전 종료일
var answer = 0

for i in 0..<n {
    // 입력받은 꽃의 개수가 1개 이하일 경우
    if flowers.count <= 1 {
        if flowers.count == 0 { break }
        else {
            if flowers[0][0] == 301 && flowers[0][1] > 1130 { answer = 1; break }
            else { break }
        }
    }
    
    // 꽃이 피는 시기가 start 이전일 경우
    if flowers[i][0] <= start {
        if flowers[i][1] > max { max = flowers[i][1] }
        
        // 마지막 반복일 경우
        if i == n-1 {
            if max > 1130 { answer += 1; break }
            else { answer = 0; break }
        }
        
        // 다음 꽃의 시작 시기가 start 이후일 경우 시행되어야 할 업데이트
        else if flowers[i+1][0] > start {
            answer += 1
            start = max
            if start > 1130 { break }
        }
    }
    
    // 꽃이 피는 시기가 start 이후일 경우
    else { answer = 0; break }
}


print(answer)