//
//  main.swift
//  Lv.1-덧칠하기
//  1차시도 - 성공+실패(시간초과) 42점 -이중for문+while
//  2차시도 - 성공+실패(시간초과) 72점 -Set이용+이중while
//  3차시도 - 성공 - 마지막 인덱스 값만 가지고 비교하는 방법
//  Created by zzee22su on 2023/04/02.
//

import Foundation


//1차시도
func solution1(_ n:Int, _ m:Int, _ section:[Int]) -> Int {
    var copySection = section
    var painted: [[Int]] = []
    var checkContinue: Bool = false

    for i in copySection {
        checkContinue = false //반복문 탈출을 위한 변수

        for j in painted {
            //페인트 덧칠 전에, 지금 페인트칠할 구역이 이미 덧칠한 구역(painted)과 동일한 구역인지 확인 후
            //확인하고 있다면 재덧칠하지 않고 패스한다
            //덧칠하지 않기 때문에 copySection 배열에서도 해당 구역을 삭제시킨다
            if j.contains(i) {
                //배열이 없는 상태에서 removeFirst() 시, 런타임 에러가 발생하므로 빈 배열인지 아닌지 체크하였음
                if !copySection.isEmpty {
                    copySection.removeFirst()
                    checkContinue = true
                }
                break
            }
        }

        if checkContinue {
            continue
        }

        //한 번에 덧칠할 구역의 범위를 설정해준다
        //ex)2번 구역이 덧칠해야할 구역이고 롤러의 길이가(m) 4라면 2, 3, 4, 5를 한 번에 덧칠할 수 있디
        //start+m-1은 -> 2~5까지의 구역을 설정하기 위함 -> 2+4-1
        var start = i
        var range = start...(start+m-1)

        //range.max()는 2~5까지일 때 5를 뜻함 5가 전체 구역을 넘지 않는지 확인하고 범위가 초과된다면 시작범위를 1씩 빼주어 범위를 재설정핸다
        while range.max()! > n {
            start -= 1
            range = start...(start+m-1)
        }

        if !copySection.isEmpty {
            copySection.removeFirst()
        } else {
            copySection = []
        }

        painted.append(Array(range))
    }


    return painted.count
}

//2차시도
func solution2(_ n:Int, _ m:Int, _ section:[Int]) -> Int {
    var copySection = section
    var painted: Set<Set<Int>> = []

    while !copySection.isEmpty {
        //첫 번째 원소를 삭제 및 i에 저장한다
        let i = copySection.removeFirst()
        //i가 painted에 있는지 확인(이미 덧칠되어있는지 확인)
        let con = painted.contains {$0.contains(i)}

        //이미 덧칠되어있다면 패스
        if con {
            continue
        }

        //한 번에 덧칠할 구역의 범위를 설정해준다
        //ex)2번 구역이 덧칠해야할 구역이고 롤러의 길이가(m) 4라면 2, 3, 4, 5를 한 번에 덧칠할 수 있디
        //start+m-1은 -> 2~5까지의 구역을 설정하기 위함 -> 2+4-1
        var start = i
        var range = start...(start+m-1)

        //range.max()는 2~5까지일 때 5를 뜻함 5가 전체 구역을 넘지 않는지 확인하고 범위가 초과된다면 시작범위를 1씩 빼주어 범위를 재설정핸다
        while range.max()! > n {
            start -= 1
            range = start...(start+m-1)
        }

        painted.insert(Set(range))
    }
    return painted.count
}

//3차시도 - 성공
func solution3(_ n:Int, _ m:Int, _ section:[Int]) -> Int {
    var count = 0
    var endIdx = 0 //페인트가 마지막으로 칠해진 인덱스 값
    
    for i in section {
        if i > endIdx { //i가 endIdx보다 페인트칠하지 않은 경우이다 반대로 endIdx가 i보다 크다는 건 칠해야 하는 구역 i가 이미 칠해져있는 경우이다
            count += 1
            endIdx = i+m-1
        }
    }
    
    return count
}


print(solution3(8, 4, [2,3,6])) // 2
print(solution3(5, 4, [1,3])) //1
print(solution3(4, 1, [1,2,3,4])) //4



