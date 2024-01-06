import Foundation

var graph = [Int: [Int]]()
var start = -1

var donutCount = 0
var stickCount = 0
var eightCount = 0

func solution(_ edges:[[Int]]) -> [Int] {
    for edge in edges {
        graph[edge[0], default: []].append(edge[1])
    }
    
    var maxValueCount = 0
    for (key, value) in graph {
        if maxValueCount <= value.count {
            start = key
            maxValueCount = value.count
        }
    }
    donutCount += graph[start]?.count ?? 0
    graph[start] = nil
    
    var inCountDict = [Int: Int]()
    var outCountDict = [Int: Int]()
    
    for edge in edges {
        inCountDict[edge[1], default: 0] += 1
        outCountDict[edge[0], default: 0] += 1
    }
    
    for (key, value) in inCountDict {
        if outCountDict[key, default: 0] == 0 {
            stickCount += 1
            donutCount -= 1
        } else if value >= 2 && outCountDict[key, default: 0] >= 2 {
            eightCount += 1
            donutCount -= 1
        }
    }
    
    return [start, donutCount, stickCount, eightCount]
}