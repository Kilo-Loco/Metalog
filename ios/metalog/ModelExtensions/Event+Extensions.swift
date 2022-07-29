//  Event+Extensions.swift
//  Metalog
//  License: https://github.com/Kilo-Loco/Metalog/blob/main/LICENSE

import Foundation

extension Event: Equatable {
    public static func == (lhs: Event, rhs: Event) -> Bool {
        return lhs.id == rhs.id
        && lhs.name == rhs.name
        && lhs.occurrenceCount == rhs.occurrenceCount
        && lhs.createdAt == rhs.createdAt
        && lhs.updatedAt == rhs.updatedAt
    }
}

extension Event: Hashable {
    public func hash(into hasher: inout Hasher) {
        hasher.combine(id)
    }
}

extension Event: Identifiable {}

extension Event {
    var dateString: String {
        let formatter = DateFormatter()
        formatter.dateStyle = .short
        formatter.timeStyle = .short
        return formatter.string(from: creationDate.foundationDate)
    }
    
    static let dummyEvents: [Event] = [
        Event(
            name: "Make breakfast",
            creationDate: .now(),
            occurrenceCount: 100,
            lastOccurrenceDate: .now()
        ),
        Event(
            name: "Go to park",
            creationDate: .now(),
            occurrenceCount: 16,
            lastOccurrenceDate: .now()
        ),
        Event(
            name: "Explain situation",
            creationDate: .now(),
            occurrenceCount: 9,
            lastOccurrenceDate: .now()
        ),
        Event(
            name: "Incorrect statement",
            creationDate: .now(),
            occurrenceCount: 77,
            lastOccurrenceDate: .now()
        ),
        Event(
            name: "Go to beach",
            creationDate: .now(),
            occurrenceCount: 3,
            lastOccurrenceDate: .now()
        ),
    ]
}
