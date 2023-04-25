//
//  main.swift
//  시소 짝꿍
//
//  Created by dylan on 2023/04/22.
//

import Foundation

func solution(_ weights:[Int]) -> Int64 {
    var dic: [Int: Int] = [:]
    let sortedWeights = weights.sorted { a, b in
        return a > b
    }
    
    var total = 0
    
    
    for weight in sortedWeights {
        if let count = dic[weight] {
            total += count
        }
        
        if let count = dic[weight * 2] {
            total += count
        }
        
        if(weight * 3 % 2 == 0) {
            if let count = dic[weight * 3 / 2] {
                total += count
            }
        }
        
        if(weight * 4 % 3 == 0) {
            if let count = dic[weight * 4 / 3] {
                total += count
            }
        }
        
        if let weightCount = dic[weight] {
            dic[weight] = weightCount + 1
        } else {
            dic[weight] = 1
        }
    }
    
    return Int64(total)
}

print(solution([100,180,360,100,270]))

