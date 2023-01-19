import Foundation

func solution(_ n:Int) -> Int {
    var threeRadix = Array(String(n, radix: 3))
    threeRadix = threeRadix.reversed()
    let reversedThree = String(threeRadix)
    
    return Int(reversedThree, radix: 3)!
}