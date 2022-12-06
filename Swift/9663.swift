let N = Int(readLine()!)!
var board = Array(repeating: -1, count: N)

func promising(_ cdx: Int) -> Bool {
    for i in 0..<cdx {
        if board[cdx] == board[i] || cdx - i == abs(board[cdx] - board[i])  {
            return false
        }
    }

    return true
}

var count = 0
func nqueen(_ cdx: Int) {
    if cdx == N {
        count += 1
        return
    }

    for i in 0..<N {
        board[cdx] = i

        if promising(cdx) {
            nqueen(cdx + 1)
        }
    }
}
nqueen(0)
print(count)