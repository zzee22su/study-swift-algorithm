import Foundation

func solution(_ t:String, _ p:String) -> Int {
    
    func getSubstrings(_ input: String, _ length: Int) -> [String] {
        var result = [String]()
        
        for i in 0...input.count - length {
            let startIdx = input.index(input.startIndex, offsetBy: i)
            let endIdx = input.index(input.startIndex, offsetBy: i + length)
            
            print(String(input[startIdx..<endIdx]))
            result.append(String(input[startIdx..<endIdx]))
        }
        
        return result
    }
    
    // 1. 앞에서부터 p의 길이대로 자른 문자열 배열 생성
    var substrings = getSubstrings(t, p.count)
    
    // 2. string comparison으로 비교. 고차함수 이용하기
    return substrings.filter{ $0.compare(p).rawValue <= 0}.count
}
