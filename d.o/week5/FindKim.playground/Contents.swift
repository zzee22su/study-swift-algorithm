import Foundation

func solution(_ seoul:[String]) -> String {
    var count = 0
    for Seoul in seoul {
        guard Seoul == "Kim" else {
            count += 1
            continue
        }
        break
    }
    return "김서방은 \(count)에 있다"
}

// MARK: Note.
// for문 등 반복문 사용시, 중간에 더 반복할 필요가 없을 때 반드시 break 등으로 중지시켜야 한다
