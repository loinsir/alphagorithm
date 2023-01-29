import Foundation

func solution(_ begin:String, _ target:String, _ words:[String]) -> Int {
    if !words.contains(target) {
        return 0
    }
    
    var answer = Int.max
    var visited = [String: Bool]()
    for i in words {
        visited[i] = false
    }
    
    var q = [(String, Int)]()
    q.append((begin, 0))
    while !q.isEmpty {
        
        let current = q.removeFirst()
        
        if current.0 == target {
            answer = min(answer, current.1)
            break
        }
        
        for word in words {
            var different = 0
            
            for i in 0..<begin.count {
                if word[word.index(word.startIndex, offsetBy: i)] != current.0[current.0.index(current.0.startIndex, offsetBy: i)] {
                    different += 1
                }
            }
            if different == 1 && !visited[word]! {
                visited[word] = true
                q.append((word, current.1+1))
            } 
        }
    }
    
    func dfs(_ currentWord: String, _ depth: Int) {
        print(currentWord, depth)
        if currentWord == target {
            answer = min(answer, depth)
            return
        }
        
        for word in words {
            var different = 0
            
            for i in 0..<begin.count {
                if word[word.index(word.startIndex, offsetBy: i)] != currentWord[currentWord.index(currentWord.startIndex, offsetBy: i)] {
                    different += 1
                }
            }
            
            if different == 1 && !visited[word]! {
                visited[word] = true
                dfs(word, depth+1)
            } 
        }
    }
    
    dfs(begin, 0)
    
    return answer
}