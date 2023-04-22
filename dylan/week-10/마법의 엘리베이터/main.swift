//
//  main.swift
//  마법의 엘리베이터
//
//  Created by dylan on 2023/04/22.
//

import Foundation

func solution(_ storey:Int) -> Int {
    func getNumberOfDigits(_ floor: Int) -> [Int] {
        let totalCount = String(abs(floor)).count
        var arr: [Int] = []
        
        for index in 1...totalCount {
            let order: Double = Double(index)
            let numOfDigit = (floor % Int(pow(10, order))) / Int(pow(10, order - 1))
            
            arr.append(numOfDigit)
        }
        
        return arr
    }
    
    var nums = getNumberOfDigits(storey)
    var start = 0
    var count = 0
    
    while(start < nums.count) {
        let numOfDigit = nums[start]
        
        if(numOfDigit == 0) {
            start += 1
            continue
        }
        
        
        
        if(numOfDigit < 6) {
            count += numOfDigit
            
            if(start == nums.count - 1 && nums[start] == 5) {
                start += 1
                continue
            }
            
            if(start != nums.count - 1 && nums[start] == 5 && nums[start + 1] > 4) {
                nums[start + 1] += 1
            }
        } else {
            count += (10 - numOfDigit)
            
            if(start == nums.count - 1) {
                count += 1
            } else {
                nums[start + 1] += 1
            }
        }
        
        start += 1
    }
    
    return count
}

print(solution(555))
print(solution(455))

