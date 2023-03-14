import Foundation

func solution(_ babbling:[String]) -> Int {
    if babbling.count == 0 {
        return 0
    }
    
    var availableWords = ["aya":"1", "ye":"2", "woo":"3", "ma":"4"]
    var replacedWords = babbling.map {
        return replaceBabblingWithKeyword(of: $0, keywordMap: availableWords)
    }
    
    return replacedWords.filter {
        // 1,2,3,4로만 문자열이 구성되어 있는지 확인
        var copied = $0
        for val in availableWords.values {
            copied = copied.replacingOccurrences(of: val, with: "")
        }
        
        if copied != "" { return false }
        
        // 길이가 0,1이면 무조건 true임
        if $0.count < 2 { return true}
        
        // 연속된 문자가 있는지 확인
        for i in 0..<$0.count - 1 {
            var source = $0[$0.index($0.startIndex, offsetBy: i)]
            var target = $0[$0.index($0.startIndex, offsetBy: i+1)]
            
            if source == target { return false }
        }
        
        return true
    }.count
}

func replaceBabblingWithKeyword(of string: String, keywordMap: [String:String]) -> String {
    var replaced = string
    for word in keywordMap {
        replaced = replaced.replacingOccurrences(of: word.key, with: word.value)
    }
    return replaced
}

