//
//  main.swift
//  Lv.2-부분_수열_찾기
//
//  Created by zzee22su on 2023/04/17.
//

import Foundation

func solution(_ sequence: [Int], _ k: Int) -> [Int] {
    var start = 0
    var end = 0
    var sum = 0
    var minLength = Int.max
    var minStartIndex = -1
    
    while start < sequence.count {
        // 현재 부분 수열에서의 합이 k보다 작은 경우 end 인덱스 증가
        while end < sequence.count && sum < k {
            sum += sequence[end]
            end += 1
        }
        
        if sum == k {
            if end - start < minLength {
                minLength = end - start
                minStartIndex = start
            }
        }
        
        sum -= sequence[start]
        start += 1
    }
    
    return [minStartIndex, minStartIndex + minLength - 1]
}



