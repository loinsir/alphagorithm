import Foundation

func solution(_ s:String) -> [Int] {
    var str = s
    str = String(s[s.index(s.startIndex, offsetBy: 2)...s.index(s.startIndex, offsetBy: s.count-3)])
    var sList = [[Int]]()
    var stringS = str.split(separator: "}").map { String($0) }
    for strs in stringS {
        var tmpStr = strs.replacingOccurrences(of: "{", with:"")
        let tmpArr = tmpStr.split(separator: ",").map{ Int(String($0))! }
        sList.append(tmpArr)
    }

    sList.sort(by: { $0.count < $1.count })
    
    var tmpSet = Set<Int>()
    var result = [Int]()
    for s in sList {
        var sets = Set<Int>(s)
        let toAppend = Array(sets.subtracting(tmpSet))
        result.append(toAppend[0])
        tmpSet = Set<Int>(result)
    }
    
    return result
}