//
//  main.swift
//  옹알이
//  https://school.programmers.co.kr/learn/courses/30/lessons/133499
//  Created by dylan on 2023/03/12.
//

import Foundation

func solution(_ babbling: [String]) -> Int {
    var stack: Array<String> = []
    var count = 0
    
    let pronunciations = ["aya", "ye", "woo", "ma"]
    
    func checkAvailable(_ str: String) -> Bool {
        return pronunciations.contains(str)
    }
    
    for babble in babbling {
        var str = ""
        for word in babble {
            str += String(word)
            
            let isAvailable = checkAvailable(str)
            if(isAvailable) {
                if(str == stack.last) {
                    let _ = stack.popLast()
                } else {
                    stack.append(str)
                }
                
                str = ""
            }
        }
        
        if(babble == stack.joined()) {
            count += 1
        }
        
        stack = []
    }
    
    return count
}

print("옹알이(2) answer: ", solution(["ayaye", "uuu", "yeye", "yemawoo", "ayaayaa"]))
