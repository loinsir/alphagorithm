func solution(_ files:[String]) -> [String] {
    
    let originalFiles = files
    
    var items = [[String]]()
    
    for file in files {
        var numberStartIndex = 0
        
        for i in 0..<file.count {
            if Int(file[i]) != nil {
                numberStartIndex = i
                break
            }
        }
        
        var numberEndIndex = 0
        
        for i in numberStartIndex..<min(numberStartIndex+6, file.count) {
            if Int(file[i]) == nil {
                break
            }
            numberEndIndex = i
        }
        
        if numberEndIndex == file.count-1 {
            items.append([file[0..<numberStartIndex], file[numberStartIndex..<numberEndIndex+1], ""])
        } else {
            items.append([file[0..<numberStartIndex], file[numberStartIndex..<numberEndIndex+1], file[numberEndIndex+1..<file.count]])
        }
    }
    
    items.sort(by: {
        if $0[0].lowercased() != $1[0].lowercased() {
            return $0[0].lowercased() < $1[0].lowercased()
        }
        
        if Int($0[1])! != Int($1[1]) {
            return Int($0[1])! < Int($1[1])!
        }
        
        return originalFiles.firstIndex(of: $0.reduce("", +))! < originalFiles.firstIndex(of: $1.reduce("", +))!
    })
    
    return items.map { $0.reduce("", +) }
}

extension String {
    subscript(_ index: Int) -> String {
        return String(self[self.index(self.startIndex, offsetBy: index)])
    }
    
    subscript(_ range: Range<Int>) -> String {
        let fromIndex = self.index(self.startIndex, offsetBy: range.startIndex)
        let toIndex = self.index(self.startIndex, offsetBy: range.endIndex)
        return String(self[fromIndex..<toIndex])
    }
}