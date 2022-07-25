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

typealias NewEventReducer = Reducer<NewEventState, NewEventAction, SystemEnvironment<NewEventEnvironment>>

let newEventReducer = NewEventReducer { state, action, sysEnv in
    debugPrint(action)
    switch action {
    case .newEventChanged(let newEvent):
        state.newEvent = newEvent
    case .saveNewEvent:
        break
    case .newEventSaved(.success(let event)):
        break
    case .newEventSaved(.failure(let error)):
        break
    }
    return .none
}

