import Foundation
import SwiftUI

enum InterviewResult: String, CaseIterable, Codable {
    case pass
    case fail
    case revisit
}

let result: InterviewResult = .fail
print("interview result: \(result.rawValue)")

enum Interviewer: String, CaseIterable, Codable {
    case namrata = "Namrata"
    case lea = "Lea"
    case ray = "Ray"
    case david = "David"
}

for interviewer in Interviewer.allCases {
    print(interviewer.rawValue)
}


let interviewer: Interviewer = .namrata
print("interviewer: \(interviewer.rawValue)")


enum InterviewStatus: RawRepresentable, CaseIterable, Codable {
    typealias RawValue = Color
    
    // add nullable constructor because the enum is represented by a color..
    init?(rawValue: Color) {
        switch rawValue {
        case .green:
            self = .complete(result: .pass)
        case .red: self = .complete(result: .fail)
        case .yellow: self = .scheduled(interviewer: .ray)
        case .blue: self = .requested
        default: return nil
        }
    }
    
    var rawValue: Color {
        switch self {
        case .requested: return .blue
        case .scheduled(_): return .yellow
        case .complete(result: .pass): return .green
        case .complete(result: .fail): return .red
        case .complete(result: .revisit): return .gray
        }
    }
    
    static var allCases: [InterviewStatus] {
        [.requested] +
        Interviewer.allCases.map { .scheduled(interviewer: $0) } +
        InterviewResult.allCases.map { .complete(result: $0) }
    }
    
    case requested
    case scheduled(interviewer: Interviewer)
    case complete(result: InterviewResult)
}

let status: InterviewStatus = .scheduled(interviewer: .namrata)
print(status)

print(InterviewStatus.allCases)

struct Interview: Codable {
    var interviewee: String
    var interviewer: Interviewer?
    var status: InterviewStatus
    
    init(interviewee: String, interviewer: Interviewer? = nil) {
        self.interviewee = interviewee
        if let interviewer = interviewer {
            self.interviewee = interviewee
            self.interviewer = interviewer
            self.status = InterviewStatus.scheduled(interviewer: interviewer)
        } else {
            self.status = .requested
        }
    }
    
    func printInterview() {
        switch self.interviewer {
        case .none:
            print("There is no interview yet")
        case .some(let interviewer):
            print("The interview is \(interviewer)")
        }
    }
}

var interview = Interview(interviewee: "David")
print(interview)
interview.printInterview()
interview.interviewer = .david
interview.printInterview()
interview.status = .complete(result: .pass)

do {
    let jsonData = try JSONEncoder().encode(interview)
//    print(String(data: jsonData, encoding: .utf8))
    let decodedInterview = try JSONDecoder().decode(Interview.self, from: jsonData)
    print(decodedInterview)
    print(decodedInterview.status.rawValue)
} catch {
    print(error.localizedDescription)
}

/* "{\"status\":{\"requested\":{}},\"interviewee\":\"David\"}" */

// Raw Representable is a protocol that decides what the raw value of an enum would be IF it had one..

