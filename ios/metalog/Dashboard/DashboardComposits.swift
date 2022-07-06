//  DashboardComposits.swift
//  Metalog
//  License: https://github.com/Kilo-Loco/Metalog/blob/main/LICENSE

import ComposableArchitecture
import Foundation

enum DashboardDestination: Equatable {
    case createNewEvent
}

struct DashboardState: Equatable {
    var eventState: EventState = .init()
    var newEventState: NewEventState = .init()
    var destinationPaths: [DashboardDestination] = []
}

enum DashboardAction {
    case eventAction(EventAction)
    case destinationPathsDidChange([DashboardDestination])
    case newEventAction(NewEventAction)
}

struct DashboardEnvironment { }

typealias DashboardReducer = Reducer<DashboardState, DashboardAction, SystemEnvironment<DashboardEnvironment>>
typealias DashboardStore = Store<DashboardState, DashboardAction>

let dashboardReducer = DashboardReducer { state, action, sysEnv in
    debugPrint("DASHBOARD ACTION", action)
    switch action {
    case .eventAction:
        return .none
    case .destinationPathsDidChange(let paths):
        state.destinationPaths = paths
        return .none
    case .newEventAction(.newEventSaved):
        debugPrint("newEventAction dashboard")
        state.destinationPaths.removeAll()
        return .none
    case .newEventAction:
        return .none
    }
}

let dashboardReducerPublisher = DashboardReducer.combine(
    dashboardReducer,
    newEventReducer.pullback(
        state: \.newEventState,
        action: /DashboardAction.newEventAction,
        environment: { _ in
            .live(environment: .init(eventClient: .live))
        }
    )
)
