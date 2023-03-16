//
//  main.swift
//  Lv.1-콜라츠_추측 (https://school.programmers.co.kr/learn/courses/30/lessons/12943)
//
//  Created by zzee22su on 2023/03/16.
//

import Foundation

func solution(_ num:Int) -> Int {
    var count: Int = 0
    var temp: Int = num
    
    //1이 될때까지 반복
    while temp != 1 {
        //입력된 수가 짝수라면 2로 나눈다
        if temp % 2 == 0 {
            temp = temp/2
        } else {
            //아니라면 3을 곱하고 1을 더한다
            temp = (temp * 3) + 1
        }
    
        //반복횟수 증가
        count += 1
        
        //500번 반복했다면 -1리턴
        if count == 500 {
            return -1
        }
        
    }
    return count
}

//print("결과 : \(solution(6))")
//print("결과 : \(solution(16))")
print("결과 : \(solution(626331))")

