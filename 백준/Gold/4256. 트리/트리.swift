import Foundation


let T = Int(readLine()!)!

for _ in 0..<T {
    
    let n = Int(readLine()!)!
    let pre = readLine()!.split(separator: " ").map { Int(String($0))! }
    let inorder = readLine()!.split(separator: " ").map { Int(String($0))! }

    post(0, 0, n, pre, inorder)
    print("")
}

func post(_ root: Int, _ start: Int, _ end: Int, _ pre: [Int], _ inorder: [Int]) {
    for i in start..<end {
        if pre[root] == inorder[i] {
            post(root+1, start, i, pre, inorder)
            post(root + i + 1 - start, i + 1, end, pre, inorder)
            print(pre[root], terminator: " ")
        }
    }
}