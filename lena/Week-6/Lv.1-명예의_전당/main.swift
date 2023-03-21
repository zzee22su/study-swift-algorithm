//
//  main.swift
//  Lv.1-명예의_전당
//
//  Created by zzee22su on 2023/03/20.
//

import Foundation

func solution(_ k:Int, _ score:[Int]) -> [Int] {
    var temp: [Int] = []
    var result: [Int] = []
    
    for s in score{
        temp.append(s)
        temp.sort(){ $0 > $1}
        
        if temp.count > k{
            temp.removeLast()
        }
        
        result.append(temp.last!)
    }
    
    return result
}


//print(solution(3, [10, 100, 20, 150, 1, 100, 200])) //[10, 10, 10, 20, 20, 100, 100]
print(solution(4, [0, 300, 40, 300, 20, 70, 150, 50, 500, 1000])) //[0, 0, 0, 0, 20, 40, 70, 70, 150, 300]

