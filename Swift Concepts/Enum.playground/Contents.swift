import Foundation

enum InterviewResult: String {
    case pass
    case fail
    case revisit
}

let result: InterviewResult = .fail
print("interview result: \(result.rawValue)")

enum Interviewer: String, CaseIterable {
    case namrata = "Namrata"
    case lea = "Lea"
    case ray = "Ray"
}



let interviewer: Interviewer = .namrata
print("interviewer: \(interviewer.rawValue)")


for case in Interviewer.allCases {
    print(case.rawValue)
}

print(interviewer.allCases)

enum InterviewStatus {
    case requested
    case scheduled(interviewer: Interviewer)
    case complete(result: InterviewResult)
}
let status: InterviewStatus = .scheduled(interviewer: .namrata)
print(status)

// What is case interval? --> useful to know to find all the cases
