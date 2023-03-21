//
//  main.swift
//  콜라츠_추측
//
//  Created by dylan on 2023/03/19.
//

import Foundation

func solution(_ num:Int) -> Int {
    var copiedNum = num
    var count = 0
    
    while(count <= 500) {
        if(copiedNum == 0) {
            return -1
        }
        
        if(copiedNum == 1) {
            return count
        }
        
        if(copiedNum % 2 == 0) {
            copiedNum = copiedNum / 2
            
        } else {
            copiedNum = copiedNum * 3 + 1
        }
        
        count += 1
    }
    
    return -1
}

print(solution(6))
