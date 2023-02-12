import Foundation

func solution(_ enroll:[String], _ referral:[String], _ seller:[String], _ amount:[Int]) -> [Int] {
    var parentDict = [String: String]()
    var account = [String: Int]()
    
    for i in 0..<enroll.count{
        parentDict[enroll[i]] = referral[i]
        account[enroll[i]] = 0
    }
    account["-"] = 0
    
    
    for i in 0..<amount.count {
        var money = amount[i] * 100
        var person = seller[i]
        
        while money > 0 {
            if money / 10 == 0 {
                account[person]! += money
                break
            } else {
                account[person]! += money - (money / 10)
                money /= 10
                if let par = parentDict[person] {
                    person = par
                } else {
                    break
                }
            }
        }
    }
    
    var result: [Int] = []
    for person in enroll {
        result.append(Int(account[person]!))
    }
    return result
}