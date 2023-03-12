import UIKit

/*
 
 문제: 과일 장수
 링크: https://school.programmers.co.kr/learn/courses/30/lessons/135808
 
 */

extension Array {
    func chunked(into size: Int) -> [[Element]] {
        return stride(from: 0, to: count, by: size).map {
            Array(self[$0 ..< Swift.min($0 + size, count)])
        }
    }
}

func getBoxPrice(_ box: Array<Int>) -> Int {
    let sorted = box.sorted()
    return sorted[0] * sorted.count
}

func solution(_ k:Int, _ m:Int, _ score:[Int]) -> Int {
    var sortedScore = score.sorted { next, prev in
        return next > prev
    }
    
    let arr = sortedScore.chunked(into: m)
    let boxes = arr.filter { box in
        return box.count == m
    }
    
    if boxes.count > 0 {
        var total = 0
        
        for box in boxes {
            let price = getBoxPrice(box)
            total += price
        }
        

        return total
    }
    
    return 0
}

solution(3, 4, [1, 2, 3, 1, 2, 3, 1])
