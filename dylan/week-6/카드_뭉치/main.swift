//
//  main.swift
//  카드_뭉치
//
//  Created by dylan on 2023/03/19.
//

import Foundation

func solution(_ cards1:[String], _ cards2:[String], _ goal:[String]) -> String {
    var copiedCards1 = cards1
    var copiedCards2 = cards2
    
    func canBeUsed(_ str: String) -> Bool {
        let dequeuedCards1 = copiedCards1.isEmpty ? nil : copiedCards1[0]
        let dequeuedCards2 = copiedCards2.isEmpty ? nil : copiedCards2[0]
        
        if(dequeuedCards1 == str) {
            copiedCards1 = Array(copiedCards1.dropFirst())
            return true
        }
        
        if(dequeuedCards2 == str) {
            copiedCards2 = Array(copiedCards2.dropFirst())
            return true
        }
        
        return false
    }
    
    for str in goal {
        let result = canBeUsed(str)
        
        if result {
            continue
        }
        
        return "No"
    }
    
    return "Yes"
}

print(solution(["i", "drink", "water"], ["want", "to"], ["i", "want", "to", "drink", "water"]))
