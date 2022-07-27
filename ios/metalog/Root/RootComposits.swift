//  RootComposits.swift
//  Metalog
//  License: https://github.com/Kilo-Loco/Metalog/blob/main/LICENSE

import ComposableArchitecture

enum Route: Equatable, Hashable {
    case createNewEvent
}

struct NavigationState: Equatable {
    var destinationPaths: [Route] = []
}

enum NavigationAction {
    case goTo(Route)
    case updateRoutes([Route])
}

struct NavigationEnvironment {}

typealias NavigationReducer = Reducer<NavigationState, NavigationAction, NavigationEnvironment>

let navigationReducer = NavigationReducer { state, action, sysEnv in
    debugPrint("DASHBOARD ACTION", action)
    switch action {
    case .goTo(let route):
        state.destinationPaths.append(route)
        return .none
    case .updateRoutes(let routes):
        state.destinationPaths = routes
        return .none
    }
}

struct RootState: Equatable {
    var navigationState = NavigationState()
    var dashboardState = DashboardState()
    var eventListState = EventListState()
    var newEventState = NewEventState()
}

enum RootAction {
    case dashboardAction(DashboardAction)
    case eventListAction(EventListAction)
    case navigationAction(NavigationAction)
    case newEventAction(NewEventAction)
}

struct RootEnvironment { }

typealias RootReducer = Reducer<RootState, RootAction, SystemEnvironment<RootEnvironment>>
typealias RootStore = Store<RootState, RootAction>

let rootReducer = RootReducer.combine(
    dashboardReducer.pullback(
        state: \.dashboardState,
        action: /RootAction.dashboardAction,
        environment: { _ in .live(environment: DashboardEnvironment()) }
    ),
    navigationReducer.pullback(
        state: \.navigationState,
        action: /RootAction.navigationAction,
        environment: { _ in NavigationEnvironment() }
    ),
    eventsReducer.pullback(
        state: \.eventListState,
        action: /RootAction.eventListAction,
        environment: { _ in EventEnvironment(eventClient: .live) }
    ),
    newEventReducer.pullback(
        state: \.newEventState,
        action: /RootAction.newEventAction,
        environment: { _ in NewEventEnvironment(eventClient: .live) }
    ),
    Reducer { state, action, _ in
        switch action {
        case .newEventAction(.newEventSaved(.success)):
            return Effect(value: RootAction.navigationAction(.updateRoutes([])))
        default:
            return .none
        }
    }
)

extension RootStore {
    static let live = RootStore(
        initialState: RootState(),
        reducer: rootReducer,
        environment: .live(environment: RootEnvironment())
    )
    
    static let dev = RootStore(
        initialState: RootState(),
        reducer: rootReducer,
        environment: .dev(environment: RootEnvironment())
    )
}
