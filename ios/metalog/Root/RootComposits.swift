//  RootComposits.swift
//  Metalog
//  License: https://github.com/Kilo-Loco/Metalog/blob/main/LICENSE

import ComposableArchitecture

struct RootState {
    var dashboardState = DashboardState()
}

enum RootAction {
    case dashboardAction(DashboardAction)
}

struct RootEnvironment { }

typealias RootReducer = Reducer<RootState, RootAction, SystemEnvironment<RootEnvironment>>
typealias RootStore = Store<RootState, RootAction>

let rootReducer = RootReducer.combine(
    dashboardReducer.pullback(
        state: \.dashboardState,
        action: /RootAction.dashboardAction,
        environment: { _ in .live(environment: DashboardEnvironment()) }
    )
)
