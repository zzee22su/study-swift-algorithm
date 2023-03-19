//
//  main.swift
//  Lv.1-체육복
//
//  Created by zzee22su on 2023/03/19.
//

import Foundation

func solution(_ n:Int, _ lost:[Int], _ reserve:[Int]) -> Int {
    var students = [Int](repeating: 1, count: n) // 체육복이 있는 학생을 1로 초기화
    var count = 0
    
    //체육복을 도난당한 학생들을 0으로 표시
    //도난당한 학생이 2번, 4번일경우
    //2번 학생은 배열에서 1번째, 4번 학생은 배열에서 3번째이기 때문에 -1을 해주는 것
    for l in lost {
        students[l-1] -= 1
    }
    
    //여벌 체육복을 가진 학생들은 1 추가
    for r in reserve {
        students[r-1] += 1
    }
    
    //체육복을 빌려줄 수 있는 경우, 체육복을 빌려주고 학생 수를 증가시킨다
    for i in 0..<n {
        //체육복이 없는 친구
        if students[i] == 0 {
            //앞 번호 친구가 여벌 체육복이 있는 경우
            if i > 0 && students[i-1] == 2 {
                //빌렸으니 0에서 1이 됌
                students[i] += 1
                //빌려줬으니 -1
                students[i-1] -= 1
            }
            //뒷 번호 친구가 여벌 체육복이 있는 경우
            else if i < n-1 && students[i+1] == 2 {
                students[i] += 1
                students[i+1] -= 1
            }
        }
    }
    
    // 체육복이 있는 학생의 수를 카운트
    for student in students {
        if student > 0 {
            count += 1
        }
    }
    
    return count
}

//print(solution(5, [2, 4], [1, 3, 5]))
//print(solution(5, [2, 4], [3]))
print(solution(3, [3], [1]))
