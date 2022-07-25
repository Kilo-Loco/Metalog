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
    let addOccurrence: (Event) -> Effect<Event, MetalogError>
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
        },
        addOccurrence: { event in
            var updatedEvent = event
            updatedEvent.occurrenceCount += 1
            
            let occurrence = Occurrence(
                timestamp: 0,
                notes: nil,
                isBackdated: false,
                eventID: updatedEvent.id
            )
            
            return Amplify.DataStore.save(occurrence)
                .flatMap { _ in
                    return Amplify.DataStore.save(updatedEvent)
                }
                .mapError(MetalogError.amplifyError)
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
        },
        addOccurrence: { updatedEvent in
            return Effect(value: updatedEvent)
        }
    )
}
