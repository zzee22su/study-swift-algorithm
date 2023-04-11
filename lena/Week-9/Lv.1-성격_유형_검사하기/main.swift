//
//  main.swift
//  Lv.1-성격_유형_검사하기
//  1차시도 : 85점
//
//  Created by zzee22su on 2023/04/11.
//

import Foundation

func solution1(_ survey:[String], _ choices:[Int]) -> String {
    var standard: [Int: (String, String)] = [1:("R", "T"), 2:("C", "F"), 3:("J", "M"), 4:("A", "N")]
    var score: [Int:Int] = [1:3, 2:2, 3:1, 4:0, 5:1, 6:2, 7:3]
    var temp: [(String, Int)] = []
    var personality: String = ""

    for i in 0..<choices.count {
        if choices[i] < 4 {
            if let first = survey[i].first {
                if let index = temp.firstIndex(where: { $0.0 == String(first) }) {
                    temp[index].1 += score[choices[i]]!
                } else {
                    temp.append((String(first), score[choices[i]]!))
                }
            }
        } else if choices[i] > 4 {
            if let last = survey[i].last {
                if let index = temp.firstIndex(where: { $0.0 == String(last) }) {
                    temp[index].1 += score[choices[i]]!
                } else {
                    temp.append((String(last), score[choices[i]]!))
                }
            }
        }
    }

    for i in 1...standard.count {
        if personality.count == 4 {
            break
        }

        let matches = temp.filter { $0.0 == standard[i]!.0 || $0.0 == standard[i]!.1 }
        if matches.count == 2 {
            let firstValue = matches[0].1
            let secondValue = matches[1].1
            let result = firstValue > secondValue ? matches[0].0 : matches[1].0
            personality += result
        } else if matches.count == 1{
            personality += matches[0].0
        } else {
            personality += standard[i]!.0
        }

    }
    return personality

}

print(solution1(["TR", "RT", "TR"], [7, 1, 3]))
print(solution1(["AN", "CF", "MJ", "RT", "NA"], [5, 3, 2, 7, 5]))
print(solution1(["RT", "RT", "TR", "FC", "CF", "MJ", "JM", "AN", "NA"], [5, 6, 3, 4, 4, 4, 6, 1, 2]))



