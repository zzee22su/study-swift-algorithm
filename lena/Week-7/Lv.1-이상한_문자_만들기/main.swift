//
//  main.swift
//  Lv.1-이상한_문자_만들기
//
//  Created by zzee22su on 2023/03/26.
//

import Foundation

func solution(_ s:String) -> String {
    let temp = s.split(separator: " ", maxSplits: Int.max, omittingEmptySubsequences: false)
    var result: String = ""

    for i in 0..<temp.count {
        for (key, value) in temp[i].enumerated() {
            print("key : \(key)")
            if key % 2 == 0 {
                result += value.uppercased()
            } else {
                result += value.lowercased()
            }
        }
        if i != temp.count-1 {
            result += " "
        }
    }
    return result
}

print(solution(" try hello world")) //"TrY HeLlO WoRlD"
