//
//  main.swift
//  서울에서_김서방_찾기
//  https://school.programmers.co.kr/learn/courses/30/lessons/12919
//  Created by dylan on 2023/03/12.
//

import Foundation

func solution(_ seoul:[String]) -> String {
    let target = "Kim"
    for (index, ele) in seoul.enumerated() {
        if(ele == target) {
            return "김서방은 \(index)에 있다"
        }
    }
    
    return ""
}

print("서울에서_김서방_찾기 answer: ", solution(["Jane", "Kim"]))

