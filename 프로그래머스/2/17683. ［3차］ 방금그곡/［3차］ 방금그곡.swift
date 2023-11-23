func solution(_ m:String, _ musicinfos:[String]) -> String {
    
    var answers = [(String, Int, Int)]()
    let m = m.replacingOccurrences(of: "C#", with: "H").replacingOccurrences(of: "D#", with: "I").replacingOccurrences(of: "F#", with: "J").replacingOccurrences(of: "G#", with: "K").replacingOccurrences(of: "A#", with: "L")
    let mLength = m.count
    var index = 0
    
    for info in musicinfos {
        let infos = info.split(separator: ",").map { String($0) }
        let starts = infos[0].split(separator: ":").map { Int(String($0))! }
        let startHour = starts[0], startMinute = starts[1]
        let ends = infos[1].split(separator: ":").map { Int(String($0))! }
        let endHour = ends[0], endMinute = ends[1]
        let title = infos[2]
        let music = infos[3].replacingOccurrences(of: "C#", with: "H").replacingOccurrences(of: "D#", with: "I").replacingOccurrences(of: "F#", with: "J").replacingOccurrences(of: "G#", with: "K").replacingOccurrences(of: "A#", with: "L")
        
        let totalPlayMinutes = (endHour - startHour) * 60 + endMinute - startMinute
        var totalPlayMusics = ""
        
        var idx = 0
        for i in 0..<totalPlayMinutes {
            totalPlayMusics.append(music[idx])
            idx += 1
            
            if idx >= music.count {
                idx = 0
            }
        }
        
        if totalPlayMusics.contains(m) {
            answers.append((title, totalPlayMinutes, musicinfos.firstIndex(of: info)!))
        }
    }

    answers.sort(by: {
        if $0.1 != $1.1 {
            return $0.1 > $1.1
        } else {
            return $0.2 < $1.2
        }
    })
    
    return answers.isEmpty ? "(None)" : answers[0].0
}

extension String {
    subscript(_ index: Int) -> String {
        return String(self[self.index(self.startIndex, offsetBy: index)])
    }
    
    subscript(_ range: Range<Int>) -> String {
        return String(self[self.index(self.startIndex, offsetBy: range.startIndex)..<self.index(self.startIndex, offsetBy: range.endIndex)])
    }
}