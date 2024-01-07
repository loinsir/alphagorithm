import Foundation

var dices = [[Int]]()
var diceCombs = [[Int]]()

var diceASums = [Int]()
var diceBSums = [Int]()

var answer = [Int]()

func solution(_ dice:[[Int]]) -> [Int] {
    dices = dice
    combination(Array(1...dice.count), dice.count / 2, [], 0)
    
    var maxCaseCount = 0
    
    for diceA in diceCombs { // 시간복잡도 최대 O(252) -> 선형시간
        let diceB = Array(1...dice.count).filter { !diceA.contains($0) }
        diceASums = diceDfs(diceA)
        diceBSums = diceDfs(diceB).sorted()
        
        var winCases = 0

        for diceASum in diceASums { // 시간복잡도 최대 O(m)
            var start = 0, end = diceBSums.count

            while start < end {
                let mid = (start + end) / 2

                if diceBSums[mid] < diceASum {
                    start = mid + 1
                } else {
                    end = mid
                }
            }

            winCases += end
        }
        
        print(winCases)
        
        if maxCaseCount <= winCases {
            maxCaseCount = winCases
            answer = diceA
        }
    }
    
    return answer
}

func diceDfs(_ dice: [Int]) -> [Int] {
    var result = [Int]()
    
    func dfs(_ index: Int, _ sum: Int) {
        if index >= dice.count {
            result.append(sum)
            return
        }
        
        for i in 0..<6 {
            dfs(index + 1, sum + dices[dice[index] - 1][i])
        }
    }
    
    dfs(0, 0)
    return result
}

func combination(_ targetArr: [Int], _ targetNum: Int, _ arr: [Int], _ index: Int) {
    if arr.count == targetNum {
        diceCombs.append(arr)
        return
    }
    
    for i in index..<targetArr.count {
        combination(targetArr, targetNum, arr + [targetArr[i]], i + 1)
    }
}