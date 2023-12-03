import Foundation

func solution(_ fees:[Int], _ records:[String]) -> [Int] {
    let defaultMinutes = fees[0], defaultCost = fees[1], unitMinutes = fees[2], unitCost = fees[3]
    var costDict = [String: Int]()
    var carInRecord = [String: Int]()
    var carInTime = [String: Int]()
    
    for record in records {
        let recordArr = record.split(separator: " ").map { String($0) }
        let timeArr = recordArr[0].split(separator: ":").map { Int($0)! }, car = recordArr[1], inOrOut = recordArr[2]
        let time = timeArr[0] * 60 + timeArr[1]
        if inOrOut == "IN" {
            carInRecord[car] = time
        } else {
            var wholeTime = time - carInRecord[car, default: 0]
            
            carInTime[car, default: 0] += wholeTime
            carInRecord[car] = nil
        }
    }
    
    for (car, inTime) in carInRecord {
        var wholeTime = (23 * 60 + 59) - inTime
        carInTime[car, default: 0] += wholeTime
        carInRecord[car] = nil
    }
    
    for (car, totalTime) in carInTime {
        var cost = defaultCost
        var wholeTime = totalTime

        while wholeTime > defaultMinutes {
            cost += unitCost
            wholeTime -= unitMinutes
        }

        costDict[car, default: 0] += cost 
    }
    
    var answer = [Int]()
    
    for key in costDict.map { $0.key }.sorted(by: { Int($0)! < Int($1)! }) {
        answer.append(costDict[key]!)
    }
    
    return answer
}

extension String {
    subscript(_ range: Range<Int>) -> String {
        let from = range.startIndex
        let to = range.endIndex
        
        return String(self[self.index(self.startIndex, offsetBy: from)..<self.index(self.startIndex, offsetBy: to)])
    }
    
    subscript(_ index: Int) -> String {
        return String(self[self.index(self.startIndex, offsetBy: index)])
    }
}