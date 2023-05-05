import Foundation

func solution(_ n:Int, _ stations:[Int], _ w:Int) -> Int{
    var answer = 0
    var stations = stations

    if stations.last! != n {
        stations.append(n+w+1)
    }
    
    var previous = -w
    for s in stations {
        let minRange = previous + w
        let maxRange = s - w - 1
        
        answer += (maxRange - minRange) / (2 * w + 1)
        if (maxRange - minRange) % (2 * w + 1) > 0 {
            answer += 1
        }
        
        previous = s
    }

    return answer
}