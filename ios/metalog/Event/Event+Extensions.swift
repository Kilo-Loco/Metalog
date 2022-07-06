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

extension Event: Identifiable {}

extension Event {
    static let dummyEvents: [Event] = [
        Event(
            name: "Make breakfast",
            initialTimestamp: 1655844047,
            occurrenceCount: 100
        ),
        Event(
            name: "Go to park",
            initialTimestamp: 1655842047,
            occurrenceCount: 16
        ),
        Event(
            name: "Explain situation",
            initialTimestamp: 1655834047,
            occurrenceCount: 9
        ),
        Event(
            name: "Incorrect statement",
            initialTimestamp: 1655744047,
            occurrenceCount: 77
        ),
        Event(
            name: "Go to beach",
            initialTimestamp: 1654844047,
            occurrenceCount: 3
        ),
    ]
}
