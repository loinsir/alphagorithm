import Foundation

func solution(_ k:Int, _ tangerine:[Int]) -> Int {
    var tangerineDict = [Int: Int]()
    
    for tan in tangerine {
        if tangerineDict[tan] == nil {
            tangerineDict[tan] = 1
        } else {
            tangerineDict[tan]! += 1
        }
    }
    
    var tang = [[Int]]()
    for (key, value) in tangerineDict {
        tang.append([key, value])
    }
    tang.sort(by: { $0[1] > $1[1] })
    
    var k = k
    var answer = 0
    if tang[0][1] > k {
        return 1
    } else {
        var i = 0
        while k > 0 {
            k -= tang[i][1]
            answer += tang[i][1]
            i += 1
        }
        return i
    }
}