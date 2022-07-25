//  EventComposits.swift
//  Metalog
//  License: https://github.com/Kilo-Loco/Metalog/blob/main/LICENSE

import Combine
import ComposableArchitecture

struct EventState: Equatable {
    var events: IdentifiedArrayOf<Event> = []
}

enum EventListAction {
    case event(id: Event.ID, action: EventAction)
}

enum EventAction {
    case createOccurrence
}

struct EventEnvironment {
    let eventClient: EventClient
}

let eReducer = Reducer<Event, EventAction, EventEnvironment> { state, action, env in
    switch action {
    case .createOccurrence:
        return .none
    }
}

let eventsReducer = Reducer<EventState, EventListAction, EventEnvironment>.combine(
    Reducer { state, action, env in
        switch action {
        case .event:
            return .none
        }
    },
    eReducer.forEach(
        state: \.events,
        action: /EventListAction.event(id:action:),
        environment: { _ in .init(eventClient: .live) }
    )
)

