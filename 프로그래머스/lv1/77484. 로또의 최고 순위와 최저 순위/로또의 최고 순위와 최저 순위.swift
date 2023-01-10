import Foundation

func solution(_ lottos:[Int], _ win_nums:[Int]) -> [Int] {
    var lottos = lottos
    var win_nums = win_nums
    var counts = 0
    var zeroCount = 0
    
    var answers = [Int]()
    
    for num in lottos {
        if num == 0 {
            zeroCount += 1
            continue
        }
        for ans in win_nums {
            if num == ans {
                counts += 1
                break
            }
        }
    }
    var maxNum = 0
    if counts > 0 {
        maxNum = 7 - counts - zeroCount
    } else if zeroCount == 6 {
        maxNum = 1
    } else {
        maxNum = 6 - zeroCount
    }
    answers.append(maxNum)
    
    answers.append([7-counts, 6].min()!)
    
    return answers
}