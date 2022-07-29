//  EventDetailsComposits.swift
//  Metalog
//  License: https://github.com/Kilo-Loco/Metalog/blob/main/LICENSE

import ComposableArchitecture

struct EventDetailsState: Equatable {
    let event: Event
    var occurrences: IdentifiedArrayOf<Occurrence> = []
}

enum EventDetailsAction {
    case onAppear
    case getOccurrencesResponse(Result<[Occurrence], MetalogError>)
}

struct EventDetailsEnvironment {
    let eventClient: EventClient
}

let eventDetailsReducer = Reducer<EventDetailsState, EventDetailsAction, EventDetailsEnvironment> { state, action, env in
    switch action {
    case .onAppear:
        return env.eventClient.getOccurrencesForEvent(state.event)
            .catchToEffect(EventDetailsAction.getOccurrencesResponse)
        
    case .getOccurrencesResponse(.success(let occurrences)):
        state.occurrences = IdentifiedArray(uniqueElements: occurrences)
        
    case .getOccurrencesResponse(.failure(let error)):
        print(error)
    }
    
    return .none
}
