import Foundation

func solution(_ number:Int, _ limit:Int, _ power:Int) -> Int {
    
    // 1. 기사 별 약수 개수 구하기
    var knightDivisiorCounts = [Int]()
    for i in 1...number {
        knightDivisiorCounts.append(getDivisorCount(i))
    }
    
    return knightDivisiorCounts.map { $0 > limit ? power : $0 }.reduce(0,+)
}

func getDivisorCount (_ n: Int) -> Int {
    if n == 1 { return 1 }
    
    var divisor = [Int]()
    // 제곱근 구하기
    let sqrtValue = sqrt(Double(n))
    
    // 제곱근이 있을 때
    if pow(Decimal(sqrtValue), 2) == Decimal(n) {
        for i in 1...(Int(sqrtValue) - 1) {
            if n % i == 0 {
                divisor.append(i)
            }
        }
        return (divisor.count * 2) + 1
    }
    
    // 제곱근이 없을 때
    for i in 1...Int(sqrtValue) {
        if n % i == 0 {
            divisor.append(i)
        }
    }
    return divisor.count * 2
}

