//
//  main.swift
//  크기가_작은_부분문자열
//  https://school.programmers.co.kr/learn/courses/30/lessons/147355
//  Created by dylan on 2023/03/12.
//

import Foundation

func solution(_ t:String, _ p:String) -> Int {
    var startP = 0
    var endP = p.count
    var count = 0
    
    
    while(endP <= t.count) {
        let startStrIndex = t.index(t.startIndex, offsetBy: startP)
        let endStrIndex = t.index(t.startIndex, offsetBy: endP - 1)
        let subStr = t[startStrIndex...endStrIndex]
        
        if(Int(subStr)! <= Int(p)!) {
            count += 1
        }
        
        startP += 1
        endP += 1
    }
    
    return count
}

print("크기가_작은_부분문자열 answer: ", solution("3141592", "271"))

