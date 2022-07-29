//  Occurrence+Extensions.swift
//  Metalog
//  License: https://github.com/Kilo-Loco/Metalog/blob/main/LICENSE

import Foundation

extension Location: Equatable {
    public static func == (lhs: Location, rhs: Location) -> Bool {
        lhs.name == rhs.name &&
        lhs.latitude == rhs.latitude &&
        lhs.longitude == rhs.longitude
    }
}

extension Occurrence: Equatable {
    public static func == (lhs: Occurrence, rhs: Occurrence) -> Bool {
        lhs.id == rhs.id &&
        lhs.creationDate == rhs.creationDate &&
        lhs.notes == rhs.notes &&
        lhs.attachmentKeys == rhs.attachmentKeys &&
        lhs.location == rhs.location &&
        lhs.isBackdated == rhs.isBackdated &&
        lhs.eventID == rhs.eventID
    }
}

extension Occurrence: Identifiable {}
