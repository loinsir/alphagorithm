import Foundation

func solution(_ want:[String], _ number:[Int], _ discount:[String]) -> Int {
    
    var discount = Array(discount.reversed())
    var answer = 0
    
    let wantCount = want.count
    
    for start in 0..<discount.count - 9 {
        let end = start + 9
        
        var cart = [String: Int]()
        for i in start...end {
            cart[discount[i], default: 0] += 1
        }
        
        for i in 0..<wantCount {
            cart[want[i], default: 0] -= number[i]
        }
        
        if cart.allSatisfy { $0.value >= 0 } {
            answer += 1
        }
    }
    
    return answer
}