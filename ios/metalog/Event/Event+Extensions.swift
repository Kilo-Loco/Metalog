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
    static let dummyEvents: [Event] = [
        Event(
            name: "Make breakfast",
            initialTimestamp: .now(),
            occurrenceCount: 100
        ),
        Event(
            name: "Go to park",
            initialTimestamp: .now(),
            occurrenceCount: 16
        ),
        Event(
            name: "Explain situation",
            initialTimestamp: .now(),
            occurrenceCount: 9
        ),
        Event(
            name: "Incorrect statement",
            initialTimestamp: .now(),
            occurrenceCount: 77
        ),
        Event(
            name: "Go to beach",
            initialTimestamp: .now(),
            occurrenceCount: 3
        ),
    ]
}
