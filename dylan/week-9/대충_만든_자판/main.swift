//
//  main.swift
//  대충_만든_자판
//
//  Created by dylan on 2023/04/09.
//

import Foundation

//
//  main.swift
//  대충_만든_자판
//
//  Created by dylan on 2023/04/09.
//

import Foundation

func solution(_ keymap:[String], _ targets:[String]) -> [Int] {
    func input(_ target: Character) -> Int {
        var arr: [Int] = []
        
        
        for keys in keymap {
            let findedStrIndex = keys.firstIndex(of: target)
            
            if let findedStrIndex = findedStrIndex {
                let findedIntIndex = keys.distance(from: keys.startIndex, to: findedStrIndex)
                arr.append(findedIntIndex)
            }
        }
        
        return arr.min() ?? -1
    }
    
    
    var result: [Int] = []
    
    for target in targets {
        var acc = 0
        
        for str in target {
            let index = input(str)
            
            if(index == -1) {
                acc = -1
                break
            }
            
            acc += index + 1
        }
        
        result.append(acc)
    }
    
    
    
    return result
}


print(solution(["ABACD", "BCEFD"], ["ABCD","AABB"]))

