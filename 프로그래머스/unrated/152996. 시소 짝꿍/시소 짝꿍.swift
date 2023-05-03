import Foundation

func solution(_ weights:[Int]) -> Int64 {
    
    var answer: Int64 = 0
    let distances = [2, 3, 4]
    
    var answers = [[Int]]()
    
    func combi(_ targetArr: [Int], _ targetNum: Int, _ arr: [Int], _ index: Int) {
        if arr.count == targetNum {
            for i in distances {
                for j in distances {
                    if i * arr[0] == j * arr[1] {
                        answer += 1
                        answers.append([arr[0], arr[1]].sorted())
                        break
                    }
                }
            }
            return
        }
        
        for i in index..<targetArr.count {
            combi(targetArr, targetNum, arr + [targetArr[i]], i+1)
        }
    }
    
    combi(weights, 2, [], 0)
    return Int64(Set(answers).count)
}