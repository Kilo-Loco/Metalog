//  DashboardComposits.swift
//  Metalog
//  License: https://github.com/Kilo-Loco/Metalog/blob/main/LICENSE

import ComposableArchitecture
import Foundation

struct DashboardState: Equatable {
}

enum DashboardAction {
    case doSomething
}

struct DashboardEnvironment { }

typealias DashboardReducer = Reducer<DashboardState, DashboardAction, SystemEnvironment<DashboardEnvironment>>

let dashboardReducer = DashboardReducer { state, action, _ in
    switch action {
    case .doSomething:
        return .none
    }
}
