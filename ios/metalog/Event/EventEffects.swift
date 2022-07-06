//  EventEffects.swift
//  Metalog
//  License: https://github.com/Kilo-Loco/Metalog/blob/main/LICENSE

import Amplify
import ComposableArchitecture
import Foundation

struct NewEvent: Equatable {
    var name: String = ""
    var date: Date = .now
    var notes: String = ""
}

struct EventClient {
    let getEvents: () -> Effect<[Event], MetalogError>
    let createEvent: (NewEvent) -> Effect<Event, MetalogError>
}

extension EventClient {
    static let live = EventClient(
        getEvents: {
            Amplify.DataStore.observeQuery(for: Event.self)
                .mapError { MetalogError.amplifyError($0) }
                .map { $0.items }
                .eraseToEffect()
        },
        createEvent: { newEvent in
            let eventId = UUID().uuidString
            let occurrence = Occurrence(
                timestamp: 0,
                notes: newEvent.notes,
                isBackdated: false,
                eventID: eventId
            )
            
            return Amplify.DataStore.save(occurrence)
                .flatMap { savedOccurrence in
                    let event = Event(
                        name: newEvent.name,
                        initialTimestamp: 0,
                        occurrenceCount: 1,
                        occurrences: List(elements: [savedOccurrence])
                    )
                    
                    return Amplify.DataStore.save(event)
                }
                .mapError { MetalogError.amplifyError($0) }
                .eraseToEffect()
        }
    )
    
    static let dev = EventClient(
        getEvents: { Effect(value: Event.dummyEvents) },
        createEvent: { newEvent in
            let eventId = UUID().uuidString
            let occurrence = Occurrence(
                timestamp: 0,
                notes: newEvent.notes,
                isBackdated: false,
                eventID: eventId
            )
            
            let event = Event(
                name: newEvent.name,
                initialTimestamp: 0,
                occurrenceCount: 1,
                occurrences: List(elements: [occurrence])
            )
            
            return Effect(value: event)
        }
    )
}
