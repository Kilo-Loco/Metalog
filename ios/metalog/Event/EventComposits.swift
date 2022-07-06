//  EventComposits.swift
//  Metalog
//  License: https://github.com/Kilo-Loco/Metalog/blob/main/LICENSE

import Combine
import ComposableArchitecture

struct EventState: Equatable {
    var events: [Event] = []
}

enum EventAction {
    case onAppear
    case dataLoaded(Result<[Event], MetalogError>)
    case onError(MetalogError)
}

struct EventEnvironment {
    let eventClient: EventClient
}

typealias EventReducer = Reducer<EventState, EventAction, SystemEnvironment<EventEnvironment>>
typealias EventStore = Store<EventState, EventAction>

let eventReducer = EventReducer { state, action, sysEnv in
    switch action {
    case .onAppear:
        return sysEnv.environment.eventClient.getEvents()
            .receive(on: sysEnv.mainQueue())
            .catchToEffect()
            .map(EventAction.dataLoaded)
        
    case .dataLoaded(.success(let events)):
        state.events = events
        
    case .dataLoaded(.failure(let error)):
        debugPrint(error)
        
    case .onError:
        break
    }
    return .none
}
