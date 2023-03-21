import Foundation

func solution(_ s:String) -> String {
    
    var words = s.components(separatedBy: " ")
    var weirdStrings = words.map { (word: String) -> String in
        var result = Array<Character>()
        
        var charArr = Array(word)
        for (index, char) in charArr.enumerated() {
            if index % 2 == 0 {
                result.append(contentsOf: char.uppercased())
            } else {
                result.append(contentsOf: char.lowercased())
            }
        }
        
        return String(result)
    }
    
    return weirdStrings.joined(separator: " ")
}
