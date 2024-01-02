import Foundation

let lists = ["", "A", "E", "I", "O", "U"]

var dict = Set<String>()

func solution(_ word:String) -> Int {
    for a in lists {
        for b in lists {
            for c in lists {
                for d in lists {
                    for e in lists {
                        let str = a + b + c + d + e
                        dict.insert(str)
                    }
                }
            }
        }
    }
    
    return Array(dict).sorted().firstIndex(of: word)!
}