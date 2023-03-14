import Foundation

func solution(_ babbling:[String]) -> Int {
    let canSpeak = ["aya", "ye", "woo", "ma" ]
    var inputs = babbling
    var changedInputs: [String] = []
    var answer = 0
    
    inputs.forEach { input in
        let a = input.replacingOccurrences(of: "aya", with: "A").replacingOccurrences(of: "ye", with: "B").replacingOccurrences(of: "woo", with: "C").replacingOccurrences(of: "ma", with: "D")
        changedInputs.append(a)
    }
    
    changedInputs.forEach { changedInput in
        let a = changedInput.replacingOccurrences(of: "A", with: "").replacingOccurrences(of: "B", with: "").replacingOccurrences(of: "C", with: "").replacingOccurrences(of: "D", with: "")
        guard a == "" else { return }
        guard !changedInput.contains("AA") else { return }
        guard !changedInput.contains("BB") else { return }
        guard !changedInput.contains("CC") else { return }
        guard !changedInput.contains("DD") else { return }
        answer += 1
    }
    
    return answer
}
