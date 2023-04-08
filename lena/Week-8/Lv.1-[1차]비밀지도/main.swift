//
//  main.swift
//  Lv.1-[1차]비밀지도
//
//  Created by zzee22su on 2023/04/07.
//

import Foundation

func solution(_ n:Int, _ arr1:[Int], _ arr2:[Int]) -> [String] {
    var answer: [String] = []

    for i in 0..<arr1.count {
        let binary = arr1[i] | arr2[i]
        var padded = String(binary, radix: 2)
        while padded.count < n {
            padded.insert("0", at: padded.startIndex)
        }
        let decoded = padded.map { $0 == "1" ? "#" : " " }.joined()
        answer.append(decoded)
    }

    return answer
}



print(solution(5,[9, 20, 28, 18, 11],[30, 1, 21, 17, 28]))//["#####","# # #", "### #", "# ##", "#####"]
print(solution(6,[46, 33, 33 ,22, 31, 50],[27 ,56, 19, 14, 14, 10])) //["######", "### #", "## ##", " #### ", " #####", "### # "]
