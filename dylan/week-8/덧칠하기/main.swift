//
//  main.swift
//  덧칠하기
//
//  Created by dylan on 2023/04/02.
//

import Foundation

func solution(_ n:Int, _ m:Int, _ section:[Int]) -> Int {
    var first = 0
    var roller: [Int] = []
    
    var count = 1
    
    for ele in section {
        if(first == 0) {
            roller.append(ele)
            first = ele
            continue
        }
        
        if(ele - first < m) {
            roller.append(ele)
        }
        
        if(ele - first >= m) {
            count += 1
            first = ele
            roller = [ele]
        }
    }
    
    return count
}

print(solution(4, 1, [1, 2, 3, 4]))
//print(solution(20, 4, [1, 2, 5, 6, 9, 10, 13, 17]))

