//
//  main.swift
//  Lv.1-대충_만든_자판
//  1차시도 : 실패 -> 56.5
//  2차시도 : 성공 (break문 추가)
//  Created by zzee22su on 2023/04/09.
//

import Foundation


func solution(_ keymap:[String], _ targets:[String]) -> [Int] {
    var temp: [String:Int] = [:]
    var result: [Int] = []
    
    for keys in keymap {
        for (j, key) in keys.enumerated() {
            if let oldValue = temp.updateValue(j+1, forKey: String(key)) {
                temp[String(key)] = (oldValue > j+1) ? j+1 : oldValue
            } else {
                temp[String(key)]=j+1
            }
        }
    }
    
    for target in targets {
        var count: Int = 0
        for t in target {
            if let tt = temp[String(t)] {
                count += tt
            } else {
                count = -1
                break
            }
        }
        result.append(count)
    }
    
    return result
}

print(solution(["ABACD", "BCEFD"],["ABCD","AABB"])) //[9, 4]
print(solution(["AA"],["B"])) //[-1]
print(solution(["AGZ", "BSSS"],["ASA","BGZ"])) //[4, 6]
print(solution(["ABCDE","ABBCE"],["ABBEF"])) //-1
