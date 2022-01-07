let input = readLine()!.split(separator: " ").map { Int($0)! }
let things = readLine()!.split(separator: " ").map { Int($0)! }

let N = input[0]
let K = input[1]

var hole = [Int]()
var count = 0

for (index, thing) in things.enumerated() {
    if hole.contains(thing) { // 이미 꽂힌 상태
        continue
    } else if hole.count < N {
        hole.append(thing)
    } else { // 뽑고 꽂아야 할때
        var lastIndex = -1
        var unplugIndex = -1

        for (i, e) in hole.enumerated() { // 이미 꽂힌 물건 중 가장 나중에 쓰이는 물건을 찾기 
            var willUseIndex = -1
            for j in index+1..<things.count {
                if things[j] == e {
                    willUseIndex = j
                    break
                }
            }

            if willUseIndex == -1 {
                unplugIndex = i
                break
            } else {
                if willUseIndex > lastIndex {
                    lastIndex = willUseIndex
                    unplugIndex = i
                }
            }
        }

        hole[unplugIndex] = thing
        count+=1
    }
}

print(count)