//
//  main.swift
//  Lv.1-K번째수
//
//  Created by zzee22su on 2023/04/07.
//

import Foundation

func solution(_ array:[Int], _ commands:[[Int]]) -> [Int] {
    var result: [Int] = []
    
    for command in commands {
        //배열은 0부터 시작하기 때문에 -1 해준다
        var i = command[0]-1
        var j = command[1]-1
        var k = command[2]-1
        
        result.append(array[i...j].sorted()[k])
    }

    return result
}

print(solution([1, 5, 2, 6, 3, 7, 4],[[2, 5, 3], [4, 4, 1], [1, 7, 3]]))




