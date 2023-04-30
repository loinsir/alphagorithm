import Foundation

func solution(_ users:[[Int]], _ emoticons:[Int]) -> [Int] {
    let rates = [40, 30, 20, 10]
    let emoticonCount = emoticons.count
    let userCount = users.count
    
    var users = users
    
    var resultRegistered = 0
    var resultPrices = 0
    
    func dfs(_ emoticonPrices: [Int], _ index: Int, _ saleRate: [Int]) {
        var prices = emoticonPrices
        var rate = saleRate
        
        if index == emoticonCount {
            var registered = 0
            var totalPrices = 0
            
            for i in 0..<userCount {
                let userInfo = users[i]

                var cost = 0
                for e in 0..<emoticonCount {
                    if saleRate[e] >= userInfo[0] {
                        cost += emoticonPrices[e]
                    }
                }
                
                if cost >= userInfo[1] {
                    registered += 1
                } else {
                    totalPrices += cost
                }
            }

            if registered > resultRegistered {
                resultRegistered = registered
                resultPrices = totalPrices
            } else if registered == resultRegistered {
                resultPrices = max(resultPrices, totalPrices)
            }
            
        } else {
            for i in 0..<4 {
                prices[index] = emoticonPrices[index] - emoticonPrices[index] * rates[i] / 100
                rate[index] = rates[i]
                dfs(prices, index + 1, rate)
            }
        }
    }
    
    var saleRates = Array(repeating: 0, count: emoticons.count)
    dfs(emoticons, 0, saleRates)

    return [resultRegistered, resultPrices]
}