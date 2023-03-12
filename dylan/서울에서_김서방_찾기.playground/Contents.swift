func solution(_ seoul:[String]) -> String {
    let target = "Kim"
    for (index, ele) in seoul.enumerated() {
        if(ele == target) {
            return "김서방은 \(index)에 있다"
        }
    }
    
    return ""
}

solution(["Jane", "Kim"])
