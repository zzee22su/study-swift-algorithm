//
//  main.swift
//  Lv.2-시소_짝꿍
//  1차 시도 - 성공+실패(시간초과) : 29.4
//  n-1차 시도 - 계속되는 시간초과...
//  n차 시도 - 성공 -> 다른 사람 풀이 해석
//  Created by zzee22su on 2023/04/23.
//

import Foundation

//시간초과
func solution1(_ weights:[Int]) -> Int64 {
    var weightsCount = weights.count-1
    var meter: [Int] = [2, 3, 4]
    var count: Int = 0


    for i in 0..<weightsCount {
        var temp1: [Int] = []
        for m in meter {
            temp1.append(weights[i]*m)
        }

        for j in i+1...weightsCount {
            var temp2: [Int] = []
            for m in meter {
                temp2.append(weights[j]*m)
            }

            for t1 in temp1 {
                if temp2.contains(t1) {
                    count += 1
                    break
                }
            }

        }
    }
    return Int64(count)
}


func solution2(_ weights:[Int]) -> Int {
    //Double 타입으로 변환해서 저장
    var weights: [Double] = weights.map { Double($0) }
    var candidates: [Double: Int] = [:]
    var result = 0

    //ex) 시소 중심으로부터 왼쪽 2미터 떨어진 좌석에 앉아있는 사람과 오른쪽 3미터 또는 4미터 떨어진 좌석에 앉아있는 사람의 무게가 같아야 짝꿍이 될 수 있음
    //w2 * 2 = w3 * 3/2 = w4 * 4/3 가 만족되어야 되기 때문
    let batchList = [2.0, Double(3)/Double(2), Double(4)/Double(3) ]
        
    for weight in weights {
        if let count = candidates[weight] {
            candidates[weight] = count + 1
        } else {
            candidates[weight] = 1
        }
    }


    for (key, value) in candidates {
        //value가 2 이상인 경우 그 중 2개를 선택하는 조합의 수를 구함
            //n개의 원소 중 r개를 선택하는 방법의 수를 구하는 공식 -> n! / (r! * (n-r)!)
        if value > 1 {
            result += value * (value-1) / 2
        }
        for batch in batchList {
            let newNumber = key*batch
            if let count = candidates[newNumber] {
                result += value * count
            }
        }
    }
    return result
}



print(solution2([100, 100, 100, 200, 200, 200]))//15

print(solution2([100, 180, 360, 100, 270]))//4
