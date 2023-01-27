import Foundation

func solution(_ number:String, _ k:Int) -> String {
    var stack = [Int]()
    var numberArr = Array(number).map { Int(String($0))! }
    var deleteCount = 0
    
    for i in 0..<number.count {
        while stack.count > 0 && stack.last! < numberArr[i] && deleteCount < k{
            stack.removeLast()
            deleteCount += 1
            
            if deleteCount == k{
                break
            }
        }
        
        stack.append(numberArr[i])
    }
    
    if deleteCount == 0 {
        for i in 0..<k {
            stack.removeLast()
        }
    }
    
    return stack.map{String($0)}.joined(separator: "")
}