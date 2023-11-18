import Foundation

func solution(_ genres:[String], _ plays:[Int]) -> [Int] {
    
    var genrePlayDict = [String: [[Int]]]()
    var genreCountDict = [String: Int]()
    var uniqueDict = [Int: Int]()
    
    let genreZip = Array(zip(genres, plays))
    
    for i in 0..<genreZip.count {
        genrePlayDict[genreZip[i].0, default: []].append([genreZip[i].1, i])
        genreCountDict[genreZip[i].0, default: 0] += genreZip[i].1
    }
    
    let sortedGenres = genreCountDict.map { $0 }.sorted(by: { $0.1 > $1.1 }).map { $0.0 }

    var answer = [Int]()
    
    for genre in sortedGenres {
        let toAppends = genrePlayDict[genre, default: []].sorted(by: { $0[0] > $1[0] })
        for i in 0..<min(toAppends.count, 2) {
            answer.append(toAppends[i][1])
        }
    }
    
    
    return answer
}