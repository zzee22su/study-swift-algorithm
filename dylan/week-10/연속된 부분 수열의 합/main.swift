//
//  main.swift
//  연속된 부분 수열의 합
//
//  Created by dylan on 2023/04/22.
//

import Foundation

func solution(_ sequence:[Int], _ k:Int) -> [Int] {
    var left = 0
    var sum = 0
    
    var equalSumToK: Array<[Int]> = []
    
    for right in 0..<sequence.count {
        sum += sequence[right]
        
        if(sum == k) {
            equalSumToK.append(Array(sequence[left...right]))
        }
        
        while(sum >= k) {
            sum -= sequence[left]
            left += 1
            if(sum == k) {
                equalSumToK.append(Array(sequence[left...right]))
            }
        }
    }
    
    var dic: [[Int] : (Int, Int, Int)] = [:]
    
    for (index, arr) in equalSumToK.enumerated() {
        let length = arr.count
        
        if let tuple = dic[arr] {
            let (existedIndex, existedLength, existedCount) = tuple
            let newCount = existedCount + 1
            dic[arr] = (existedIndex, existedLength, newCount)
        } else {
            dic[arr] = (index, length, 1)
        }
    }
    
    dic.sorted { a, b in
        let aTarget = a.key
        let aInfo = a.value
        let (aIndex, aLength, aCount) = aInfo

        let bTarget = b.key
        let bInfo = b.value
        let (bIndex, bLength, bCount) = bInfo

        if(aLength > bLength) {
            return true
        }
    }
    
    return []
}

print(solution([1, 2, 3, 4, 5], 7))

