//  EventComposits.swift
//  Metalog
//  License: https://github.com/Kilo-Loco/Metalog/blob/main/LICENSE

import Combine
import ComposableArchitecture

struct EventDetailsState: Equatable {
    let event: Event
}

struct EventListState: Equatable {
    var events: IdentifiedArrayOf<Event> = []
    var eventDetailsState: EventDetailsState?
}

enum EventListAction {
    case onAppear
    case eventsResponse(Result<[Event], MetalogError>)
    case event(id: Event.ID, action: EventAction)
    case selectEvent(Event)
}

enum EventAction {
    case addOccurrence
    case addOccurrenceResponse(Result<Event, MetalogError>)
}

struct EventEnvironment {
    let eventClient: EventClient
}

let eReducer = Reducer<Event, EventAction, EventEnvironment> { state, action, env in
    switch action {
    case .addOccurrence:
        return env.eventClient.addOccurrence(state)
            .catchToEffect(EventAction.addOccurrenceResponse)
        
    case .addOccurrenceResponse(.success(let event)):
        print("add occurrence response, \(event)")
        return .none
        
    case .addOccurrenceResponse(.failure(let error)):
        print("add occurrence failed", error)
        return .none
    }
}

let eventsReducer = Reducer<EventListState, EventListAction, EventEnvironment>.combine(
    Reducer { state, action, env in
        switch action {
        case .onAppear:
            return env.eventClient.getEvents()
                .catchToEffect(EventListAction.eventsResponse)
            
        case .eventsResponse(.success(let events)):
            state.events = IdentifiedArray(uniqueElements: events)
            return .none
            
        case .eventsResponse(.failure(let error)):
            return .none
            
        case .event:
            return .none
            
        case .selectEvent(let event):
            state.eventDetailsState = .init(event: event)
            return .none
        }
    },
    eReducer.forEach(
        state: \.events,
        action: /EventListAction.event(id:action:),
        environment: { _ in .init(eventClient: .live) }
    )
)

