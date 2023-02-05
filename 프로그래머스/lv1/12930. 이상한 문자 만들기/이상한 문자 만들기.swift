func solution(_ s:String) -> String {
    var arr: [String] = []
    var x = 0
    for i in s {
        if x % 2 == 0 {
            arr.append(String(i.uppercased()))
        } else {
            arr.append(String(i.lowercased()))
        }
        x += 1
        if i == " " {
            x = 0
        }
    }
    return arr.joined()
}