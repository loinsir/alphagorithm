import Foundation

func solution(_ str1:String, _ str2:String) -> Int {
    var str1 = str1, str2 = str2
    
    var setA = [String]()
    var setB = [String]()
    
    var setADict = [String: Int]()
    var setBDict = [String: Int]()
    
    for i in 0..<str1.count-1 {
        var tempElement = ""
        let firstLetter = str1[str1.index(str1.startIndex, offsetBy: i)]
        let secondLetter = str1[str1.index(str1.startIndex, offsetBy: i+1)]
        if firstLetter.isLetter && secondLetter.isLetter {
            tempElement += String(firstLetter) + String(secondLetter)
            setA.append(tempElement.lowercased())
        }
    }
    
    for i in 0..<str2.count-1 {
        var tempElement = ""
        let firstLetter = str2[str2.index(str2.startIndex, offsetBy: i)]
        let secondLetter = str2[str2.index(str2.startIndex, offsetBy: i+1)]
        if firstLetter.isLetter && secondLetter.isLetter {
            tempElement += String(firstLetter) + String(secondLetter)
            setB.append(tempElement.lowercased())
        }
    }
    
    for e in setA {
        if setADict[e] == nil {
            setADict[e] = 1
        } else {
            setADict[e]! += 1
        }
    }
    
    for e in setB {
        if setBDict[e] == nil {
            setBDict[e] = 1
        } else {
            setBDict[e]! += 1
        }
    }
    
    var intersection = Set<String>(setA).intersection(Set<String>(setB))
    var union = Set<String>(setA).union(Set<String>(setB))
    
    var interSectionCount = 0, unionCount = 0
    
    for i in intersection {
        if let aCount = setADict[i], let bCount = setBDict[i] {
            if aCount > bCount {
                interSectionCount += bCount
            } else {
                interSectionCount += aCount
            }
        }
    }
    
    for i in union {
        var aCount = 0, bCount = 0
        if let acount = setADict[i] {
            aCount = acount
        }
        if let bcount = setBDict[i] {
            bCount = bcount
        }
        if aCount > bCount {
            unionCount += aCount
        } else {
            unionCount += bCount
        }
    }
    if interSectionCount == 0 && unionCount == 0 {
        return 65536
    }
    
    return Int(Float(interSectionCount) / Float(unionCount) * Float(65536))
}