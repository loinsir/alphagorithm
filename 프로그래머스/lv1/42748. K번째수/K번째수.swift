import Foundation

func solution(_ array:[Int], _ commands:[[Int]]) -> [Int] {
    
    var array = array
    var results = [Int]()
    
    for command in commands {
        var subArray = Array(array[command[0]-1...command[1]-1]).sorted(by: < )
        results.append(subArray[command[2]-1])
    }
    
    return results
}