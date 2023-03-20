//
//  main.swift
//  체육복
//
//  Created by dylan on 2023/03/19.
//

import Foundation

func solution(_ n: Int, _ lost: [Int], _ reserve: [Int]) -> Int {
    var student = Array(repeating: 1, count: n + 1)
    
    for nth in lost {
        let index = nth - 1
        student[index] = 0
    }
    
    for nth in reserve {
        let index = nth - 1
        
        if(student[index] == 0) {
            student[index] = 1
        } else {
            student[index] = 2
        }
    }
    
    for (index, count) in student.enumerated() {
        if(count == 1) { continue }
        
        if(index > 0 && count == 0 && student[index - 1] == 2) {
            student[index] = 1
            student[index - 1] = 1;
            continue
        }
        
        if(index < student.count && count == 0 && student[index + 1] == 2) {
            student[index] = 1;
            student[index + 1] = 1;
        }
    }
    
    return student.filter { count in
        return count != 0
    }.count - 1
}

print(solution(5, [1], []))

