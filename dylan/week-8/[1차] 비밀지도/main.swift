//
//  main.swift
//  [1차] 비밀지도
//
//  Created by dylan on 2023/04/02.
//

import Foundation

func solution(_ n:Int, _ arr1:[Int], _ arr2:[Int]) -> [String] {
    var answer: [String] = []
    
    func appendPadding(_ bin: String) -> String {
        var copied = bin
        
        while(copied.count < n) {
            copied = "0" + copied
        }
        
        return copied
    }
    
    for (index, ele) in arr1.enumerated() {
        let addedBool = ele | arr2[index]
        let binary =  String(addedBool, radix: 2)
        let paddingBin = appendPadding(binary)
            
        let converted = paddingBin.replacingOccurrences(of: "1", with: "#").replacingOccurrences(of: "0", with: " ")
        
        answer.append(converted)
    }
    
    return answer
}

print(solution(5, [9, 20, 28, 18, 11], [30, 1, 21, 17, 28]))

