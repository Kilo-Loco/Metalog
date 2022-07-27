//  NewEventComposits.swift
//  Metalog
//  License: https://github.com/Kilo-Loco/Metalog/blob/main/LICENSE

import ComposableArchitecture

struct NewEventState: Equatable {
    var newEvent: NewEvent = .init()
}

enum NewEventAction {
    case newEventChanged(NewEvent)
    case saveNewEvent
    case newEventSaved(Result<Event, MetalogError>)
}

struct NewEventEnvironment {
    let eventClient: EventClient
}

let newEventReducer = Reducer<NewEventState, NewEventAction, NewEventEnvironment> { state, action, env in
    switch action {
    case .newEventChanged(let newEvent):
        state.newEvent = newEvent
    case .saveNewEvent:
        return env.eventClient.createEvent(state.newEvent)
            .catchToEffect(NewEventAction.newEventSaved)
        
    case .newEventSaved(.success(let event)):
        state.newEvent = .init()
        break
    case .newEventSaved(.failure(let error)):
        break
    }
    return .none
}

