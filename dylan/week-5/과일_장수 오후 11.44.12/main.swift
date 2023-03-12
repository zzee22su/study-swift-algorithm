//
//  main.swift
//  과일_장수
//  https://school.programmers.co.kr/learn/courses/30/lessons/135808
//  Created by dylan on 2023/03/12.
//

import Foundation

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
    let sortedScore = score.sorted { next, prev in
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

print("과일_장수 answer: ", solution(3, 4, [1, 2, 3, 1, 2, 3, 1]))

