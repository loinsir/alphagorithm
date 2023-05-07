import Foundation 

let input = readLine()!.split(separator: " ").map { Int(String($0))! }
let (n, m) = (input[0], input[1])

var chickens = [[Int]]() // [y, x]
var house = [[Int]]()

var answer = Int.max

for y in 0..<n {
    let row = readLine()!.split(separator: " ").map { Int(String($0))! }
    
    for x in 0..<n {
        if row[x] == 2 {
            chickens.append([y, x])
        } else if row[x] == 1 {
            house.append([y, x])
        }
    }
}

var chickenIdx = [[Int]]()

func combination(_ targetArr: [Int], _ targetNum: Int, _ arr: [Int], _ index: Int) {
    if arr.count == targetNum {
        chickenIdx.append(arr)
        return
    }

    for i in index..<targetArr.count {
        if arr.count > 0 && arr.last! >= targetArr[i] { continue }
        combination(targetArr, targetNum, arr + [targetArr[i]], index+1)
    }
}


for i in 1...m {
    combination(Array(0..<chickens.count), i, [], 0) // 살아남을 치킨집 선정

    for c in 0..<chickenIdx.count {
        let combi = chickenIdx[c]
        var total = 0

        for h in 0..<house.count { // 해당 집에서 각 선정된 치킨집으로
            let currentHouse = house[h]
            var houseRange = Int.max
            for j in 0..<combi.count {
                houseRange = min(houseRange, abs(currentHouse[0] - chickens[combi[j]][0]) + abs(currentHouse[1] - chickens[combi[j]][1]))
            }
            total += houseRange
        }
        answer = min(answer, total)
    }
    chickenIdx.removeAll()
}

print(answer)