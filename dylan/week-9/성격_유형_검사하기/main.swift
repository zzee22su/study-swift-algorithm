//
//  main.swift
//  성격_유형_검사하기
//
//  Created by dylan on 2023/04/09.
//

import Foundation

func solution(_ survey:[String], _ choices:[Int]) -> String {
    let scores = [3, 2, 1, 0, 1, 2, 3]
    let middle = scores.count / 2
    
    var indicators: [Int: [Character: Int]] = [
        0: ["R": 0, "T": 0],
        1: ["C": 0, "F": 0],
        2: ["J": 0, "M": 0],
        3: ["A": 0, "N": 0]
    ]
    
    var arr: [(String, Int)] = []
    var mapped: [(Character, Int)] = []
    
    for (index, type) in survey.enumerated() {
        arr.append((type, choices[index]))
    }
    
    for (type, choice) in arr {
        let doNotAgreeType = type.first!
        let doAgreeType = type.last!
        let grade = scores[choice - 1]
        
        if(choice - 1 < middle) {
            mapped.append((doNotAgreeType, grade))
            continue
        }
        
        if(choice - 1 > middle) {
            mapped.append((doAgreeType, grade))
            continue
        }
    }
    
    
    for (type, grade) in mapped {
        if(type == "R" || type == "T") {
            indicators[0]![type]! += grade
        }
        
        if(type == "C" || type == "F") {
            indicators[1]![type]! += grade
        }
        
        if(type == "J" || type == "M") {
            indicators[2]![type]! += grade
        }
        
        if(type == "A" || type == "N") {
            indicators[3]![type]! += grade
        }
    }
    
    var result = ""
    
    for index in 0...3 {
        let dic = indicators[index]!
        
        let max = dic.max(by: { type1, type2 in
            if(type1.value == type2.value) {
                return type1 > type2
            }
            
            return type1.value < type2.value
        })!
        
        result += String(max.key)
    }
    
    return result
}

print(solution(["RT", "RT", "TR", "FC", "CF", "MJ", "JM", "AN", "NA"], [5, 6, 3, 4, 4, 4, 6, 1, 2]))
let scores = [3, 2, 1, 0, 1, 2, 3]
