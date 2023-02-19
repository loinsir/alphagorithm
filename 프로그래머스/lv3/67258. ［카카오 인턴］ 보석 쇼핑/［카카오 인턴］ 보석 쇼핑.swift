import Foundation

func solution(_ gems:[String]) -> [Int] {
    var startNum = 0
    var endNum = gems.count
    var l = 0
    var r = -1
    var gemsSetCount = Set(gems).count
    var gemsDic:[String:Int] = [:]
    var count = 0
	
    while l < gems.count && r < gems.count {
        count = gemsDic.count

        if count == gemsSetCount {

            if (endNum - startNum) > (r - l) {
                startNum = l
                endNum = r
            }
            
            if l == r {
                break
            }
            
            if let value = gemsDic[gems[l]] {
                if (value - 1) == 0 {
                    gemsDic.removeValue(forKey: gems[l])
                }
                else {
                    gemsDic[gems[l]] = value - 1
                }
            }

            l += 1
        }
        else {
            r += 1
            if r < gems.count {
                if let value = gemsDic[gems[r]]{
                    gemsDic[gems[r]] = value + 1
                }
                else {
                    gemsDic[gems[r]] = 1
                }
            }
        }
    }
    return [startNum+1, endNum+1]
}