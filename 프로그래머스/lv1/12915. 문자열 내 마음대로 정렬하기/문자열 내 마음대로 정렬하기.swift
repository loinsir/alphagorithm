func solution(_ strings:[String], _ n:Int) -> [String] {
    return strings.sorted(by: { 
        if $0[$0.index($0.startIndex, offsetBy: n)] != $1[$1.index($1.startIndex, offsetBy: n)] {
            return $0[$0.index($0.startIndex, offsetBy: n)] < $1[$1.index($1.startIndex, offsetBy: n)] 
        } else {
            return $0 < $1
        }
    })
}