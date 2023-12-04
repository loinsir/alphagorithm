import Foundation

func solution(_ p:String) -> String {
    return transform(p)
}

func transform(_ w: String) -> String {
    if w.count == 0 {
        return w
    }
    
    var u = ""
    var v = ""
    
    for i in 1..<w.count+1 {
        if isBalanced(w[0..<i]) {
            u = w[0..<i]
            v = w[i..<w.count]
            break
        }
    }
    
    print(u, v)
    
    if isBalancedRight(u) {
        return u + transform(v)
    }
    
    var result = "(" + transform(v) + ")"
    result += Array(u[1..<u.count-1]).map { 
        if $0 == "(" {
            return ")"
        } else {
            return "("
        }
    }
    
    return result
}

func isBalancedRight(_ str: String) -> Bool {
    var stack = [String]()
    var strArr = Array(str).map { String($0) }
    for char in strArr {
        if stack.isEmpty {
            stack.append(char)
        } else if stack.last! == "(" && char == ")" {
            stack.removeLast()
        } else {
            stack.append(char)
        }
    }
    
    return stack.isEmpty
}

func isBalanced(_ str: String) -> Bool {
    let arr = Array(str).map { String($0) }
    
    return arr.filter { $0 == "(" }.count == arr.filter { $0 == ")" }.count
}

extension String {
    subscript(_ index: Int) -> String {
        return String(self[self.index(self.startIndex, offsetBy: index)])
    }
    
    subscript(_ range: Range<Int>) -> String {
        let from = range.startIndex
        let to = range.endIndex
        
        return String(self[self.index(self.startIndex, offsetBy: from)..<self.index(self.startIndex, offsetBy: to)])
    }
}