import Foundation

func solution(_ numbers:[Int], _ hand:String) -> String {
    var result = [String]()
    
    var maps = [
        1: (0, 0),
        2: (0, 1),
        3: (0, 2),
        4: (1, 0),
        5: (1, 1),
        6: (1, 2),
        7: (2, 0),
        8: (2, 1),
        9: (2, 2),
        0: (3, 1),
        10: (3, 0),
        11: (3, 2)
    ]
    var currentLeft: Int = 10
    var currentRight: Int = 11
    
    for i in numbers {
        if i == 1 || i == 4 || i == 7 {
            result.append("L")
            currentLeft = i
        } else if i == 3 || i == 6 || i == 9 {
            result.append("R")
            currentRight = i
        } else {
            
            let leftDistance = abs(maps[currentLeft]!.0 - maps[i]!.0) + abs(maps[currentLeft]!.1 - maps[i]!.1)
            let rightDistance = abs(maps[currentRight]!.0 - maps[i]!.0) + abs(maps[currentRight]!.1 - maps[i]!.1)
            
            if leftDistance == rightDistance {
                if hand == "left" {
                    result.append("L")
                    currentLeft = i
                } else {
                    result.append("R")
                    currentRight = i
                }
            } else if leftDistance > rightDistance {
                result.append("R")
                currentRight = i
            } else if rightDistance > leftDistance {
                result.append("L")
                currentLeft = i
            }
        }
    }
    
    
    return result.joined(separator: "")
}