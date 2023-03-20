//
//  main.swift
//  명예의_전당
//
//  Created by dylan on 2023/03/19.
//

import Foundation

func solution(_ k:Int, _ score:[Int]) -> [Int] {
    var priorityQueue: [Int] = Array(repeating: -1, count: k)
    var result: [Int] = []
    
    func enqueueToPriorityQueue(_ grage: Int) {
        priorityQueue[priorityQueue.count - 1] = grage
        priorityQueue.sort(by: { next, prev in
            return next > prev
        })
    }
    
    func getLowestInPriorityQueue() -> Int {
        return priorityQueue.filter { grage in
            return grage != -1
        }.last!
    }
    
    for (day, grade) in score.enumerated() {
        if(day < k) {
            enqueueToPriorityQueue(grade)
        }
        
        if(day >= k && grade > priorityQueue.last!) {
            enqueueToPriorityQueue(grade)
        }
        
        result.append(getLowestInPriorityQueue())
    }
    
    return result
}

print(solution(4, [0, 300, 40, 300, 20, 70, 150, 50, 500, 1000]))

