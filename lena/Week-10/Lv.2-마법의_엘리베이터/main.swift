//
//  main.swift
//  Lv.2-마법의_엘리베이터
//  실패 : 69.2
//  Created by zzee22su on 2023/04/15.
//

import Foundation


//중간에 자릿수가 바뀌었을 때도 고려해야 될 것 같음.. ㅠ
func solution(_ storey:Int) -> Int {
    var copyOfStorey = storey
    var magicStone: Int = 0
    let number = (String(copyOfStorey).count-1) //자릿수

    for i in 0...number {

        var exponent = Int(pow(10.0, Float(i)))

        var num = 10 * exponent

        var low = (copyOfStorey/num) * num
        var top = low + num
        var middle = (low + top) / 2

        if copyOfStorey > middle || copyOfStorey == middle  {
            while copyOfStorey != top {
                copyOfStorey += exponent
                magicStone += 1
            }
        } else if copyOfStorey < middle{
            while copyOfStorey != low {
                copyOfStorey -= exponent
                magicStone += 1
            }
        }

    }


    let number2 = (String(copyOfStorey).count-1)

    magicStone += copyOfStorey / Int(pow(10.0, Float(number2)))


    return magicStone
}






//print(solution(9)) //2

//print(solution(2554)) //16
//print(solution(16)) //6
//print(solution(95)) //6
print(solution(545)) //14
//print(solution(155)) //11
//print(solution(154)) //10

