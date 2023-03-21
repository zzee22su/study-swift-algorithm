//
//  main.swift
//  Lv.1-카드_뭉치
//
//  Created by zzee22su on 2023/03/19.
//

import Foundation


func solution(_ cards1:[String], _ cards2:[String], _ goal:[String]) -> String {
    var usedCards = Set<String>()
    var index1 = 0
    var index2 = 0
    
    for word in goal {
        
        if usedCards.contains(word) {
            return "No"
        }
        
        
        if index1 < cards1.count && word == cards1[index1] {
            usedCards.insert(word)
            index1 += 1
        } else if index2 < cards2.count && word == cards2[index2] {
            usedCards.insert(word)
            index2 += 1
        } else {
            return "No"
        }
    }
    
    return "Yes"
}

//print(solution(["i", "drink", "water"], ["want", "to"], ["i", "want", "to", "drink", "water"]))

print(solution(["i", "water", "drink"], ["want", "to"], ["i", "want", "to", "drink", "water"]))







