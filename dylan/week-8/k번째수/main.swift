//
//  main.swift
//  k번째수
//
//  Created by dylan on 2023/04/02.
//

import Foundation

func solution(_ array:[Int], _ commands:[[Int]]) -> [Int] {
    var result: [Int] = []
    
    for arr in commands {
        let startIndex = arr[0] - 1
        let endIndex = arr[1] - 1
        let nthIndex = arr[2] - 1
        
        let slice = array[startIndex...endIndex].sorted()
        
        result.append(slice[nthIndex])
    }
    
    return result
}

print(solution([1, 5, 2, 6, 3, 7, 4], [[2, 5, 3], [4, 4, 1], [1, 7, 3]]))

