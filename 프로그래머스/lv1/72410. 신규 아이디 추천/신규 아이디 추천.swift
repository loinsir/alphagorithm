import Foundation

func solution(_ new_id:String) -> String {
    var id = new_id.lowercased()
    let char = "~!@#$%^&*()=+[{]}:?,<>/"
    for i in id {
        if char.contains(i) {
            id.remove(at: id.firstIndex(of: i)!)
        }
    }
    
    while id.contains("..") {
        id = id.replacingOccurrences(of: "..", with: ".")
    }
    
    var arrId = Array(id)
    if arrId[0] == "." {
        arrId.removeFirst()
    }
    
    if arrId.isEmpty {
        arrId = ["a"]
    }
    
    if arrId.last! == "." {
        arrId.removeLast()
    }
    
    while arrId.count >= 16 {
        arrId.removeLast()
    }
    
    if arrId.last! == "." {
        arrId.removeLast()
    }
    
    while arrId.count <= 2 {
        arrId.append(arrId.last!)
    }
    
    return String(arrId)
}