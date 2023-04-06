import Foundation

func solution(_ n:Int, _ arr1:[Int], _ arr2:[Int]) -> [String] {
    var answer: [String] = []

    var format = "%0\(n)ld"
    for i in 0..<n {
        let bitOrOp = arr1[i]|arr2[i]
        let binaryInt = Int(String(bitOrOp, radix: 2))!
        var binaryString = String(format: format, binaryInt)
        answer.append(binaryString.replacingOccurrences(of: "0", with: " ").replacingOccurrences(of: "1", with: "#"))
    }
    
    return answer
}
