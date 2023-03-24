//
//  main.swift
//  Lv.1-푸드_파이트_대회
//
//  Created by zzee22su on 2023/03/24.
//

import Foundation

func solution(_ food:[Int]) -> String {
    var temp: String = ""
    var result: String = ""
    
    for i in 1..<food.count {
        for _ in 0..<food[i]/2 {
            temp += String(i)
        }
    }
    
    result = temp
    result += "0"
    result += temp.reversed()

    return result
}

//print(solution([1, 3, 4, 6])) //1223330333221
print(solution([1, 7, 1, 2])) //111303111
